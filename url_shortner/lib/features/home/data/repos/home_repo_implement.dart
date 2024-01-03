import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:url_shortner/core/errors/failures.dart';
import 'package:url_shortner/features/home/data/models/url.dart';
import 'package:url_shortner/features/home/data/repos/home_repo.dart';
import 'package:url_shortner/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<UrlModel>>> getShortUrlLink(
      String longUrl) async {
    try {
      final shortenedUrl = await apiService.shortenUrl(longUrl);
      final urlModel = UrlModel(resultUrl: shortenedUrl);

      final List<UrlModel> urls = [urlModel];

      return Right(urls);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
