import 'package:bloc/bloc.dart';
import 'package:url_shortner/utils/sql_db.dart';
import 'package:equatable/equatable.dart';

part 'save_urls_state.dart';

class SaveUrlsCubit extends Cubit<SaveUrlsState> {
  final SqlDb _sqlDb = SqlDb();

  SaveUrlsCubit() : super(SaveUrlsInitial()) {
    getAllUrls();
  }

  Future<void> saveUrls(String shortUrl, String longUrl) async {
    emit(SaveUrlsLoading());

    try {
      await _sqlDb.insertData(
        "INSERT INTO notes (short_url, long_url) VALUES ('$shortUrl', '$longUrl')",
      );

      final List<Map<String, dynamic>> updatedUrls =
          await _sqlDb.readData("SELECT * FROM notes");

      emit(SaveUrlsSuccess(updatedUrls));
    } catch (e) {
      emit(SaveUrlsFailure("Failed to add URLs: $e"));
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

  Future<void> deleteUrl(int id) async {
    emit(SaveUrlsLoading());

    try {
      await _sqlDb.deleteData("DELETE FROM notes WHERE id = $id");

      final List<Map<String, dynamic>> updatedUrls =
          await _sqlDb.readData("SELECT * FROM notes");

      emit(SaveUrlsSuccess(updatedUrls));
    } catch (e) {
      emit(SaveUrlsFailure("Failed to delete URL: $e"));
    }
  }
}
