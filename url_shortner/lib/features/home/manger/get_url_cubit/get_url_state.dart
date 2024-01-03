part of 'get_url_cubit.dart';

@immutable
sealed class GetUrlState {}

final class GetUrlInitial extends GetUrlState {}

final class GetUrlSuccess extends GetUrlState {
  final List<UrlModel> urls;

  GetUrlSuccess(this.urls);
}

final class GetUrlFailure extends GetUrlState {
  String errMessage;
  GetUrlFailure(this.errMessage);
}

final class GetUrlLoading extends GetUrlState {}
