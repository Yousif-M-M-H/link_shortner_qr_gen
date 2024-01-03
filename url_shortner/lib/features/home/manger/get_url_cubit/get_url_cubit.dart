import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:url_shortner/features/home/data/models/url.dart';
import 'package:url_shortner/features/home/data/repos/home_repo.dart';

part 'get_url_state.dart';

class GetUrlCubit extends Cubit<GetUrlState> {
  GetUrlCubit(this.homeRepo) : super(GetUrlInitial());

  final HomeRepo homeRepo;

  Future<void> getShortUrl(String longUrl) async {
    emit(GetUrlLoading());
    var result = await homeRepo.getShortUrlLink(longUrl);

    result.fold(
      (failure) {
        emit(GetUrlFailure(failure.errMessage));
      },
      (urls) {
        emit(GetUrlSuccess(urls));
      },
    );
  }
}
