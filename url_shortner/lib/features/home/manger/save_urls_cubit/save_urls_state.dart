part of 'save_urls_cubit.dart';

sealed class SaveUrlsState extends Equatable {
  const SaveUrlsState();

  @override
  List<Object> get props => [];
}

final class SaveUrlsInitial extends SaveUrlsState {}

final class SaveUrlsLoading extends SaveUrlsState {}

final class SaveUrlsFailure extends SaveUrlsState {
  final errMessage;

  SaveUrlsFailure(this.errMessage);
}

final class SaveUrlsSuccess extends SaveUrlsState {
  final List<Map<String, dynamic>> urlPairs;

  SaveUrlsSuccess(this.urlPairs);
}
