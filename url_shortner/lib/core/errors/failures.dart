import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Time Out');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Time Out');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Recieve Time Out');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate');
      case DioExceptionType.cancel:
        return ServerFailure('Canceled');
      case DioExceptionType.unknown:
        return ServerFailure('There\'s an error');
      case DioExceptionType.badResponse:
        return ServerFailure.fromStatusCode(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );
    }
  }
  factory ServerFailure.fromStatusCode(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response['error']['message'] == 'Missing query.') {
        return ServerFailure('No Results');
      }
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request is not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, please try again later');
    } else if (statusCode == 429) {
      return ServerFailure('too many requests');
    } else {
      return ServerFailure('Oops there was an error ,please try again later');
    }
  }
}
