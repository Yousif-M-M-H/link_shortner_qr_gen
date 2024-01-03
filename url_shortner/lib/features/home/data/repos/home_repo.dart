import 'package:dartz/dartz.dart';
import 'package:url_shortner/core/errors/failures.dart';
import 'package:url_shortner/features/home/data/models/url.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<UrlModel>>> getShortUrlLink(String longUrl);
}
