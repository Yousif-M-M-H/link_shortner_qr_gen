import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_shortner/utils/sql_db.dart';

part 'save_urls_state.dart';

class SaveUrlsCubit extends Cubit<SaveUrlsState> {
  final SqlDb _sqlDb = SqlDb();

  SaveUrlsCubit() : super(SaveUrlsInitial()) {
    // Initialize by fetching URLs when the cubit is created
    getAllUrls();
  }

  Future<void> saveUrls(String shortUrl, String longUrl) async {
    emit(SaveUrlsLoading());

    try {
      // Save URL to database
      await _sqlDb.insertData(
        "INSERT INTO notes (short_url, long_url) VALUES ('$shortUrl', '$longUrl')",
      );

      // Fetch updated URLs from database
      final List<Map<String, dynamic>> updatedUrls =
          await _sqlDb.readData("SELECT * FROM notes");

      // Emit success state with updated URL list
      emit(SaveUrlsSuccess(updatedUrls));
    } catch (e) {
      emit(SaveUrlsFailure("Failed to add Urls: $e"));
    }
  }

  Future<void> getAllUrls() async {
    emit(SaveUrlsLoading());

    try {
      final List<Map<String, dynamic>> storedUrls =
          await _sqlDb.readData("SELECT * FROM notes");

      emit(SaveUrlsSuccess(storedUrls));
    } catch (e) {
      emit(SaveUrlsFailure("Failed to retrieve URLs: $e"));
    }
  }
}
