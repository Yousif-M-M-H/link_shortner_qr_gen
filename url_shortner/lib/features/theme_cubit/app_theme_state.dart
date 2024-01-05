part of 'app_theme_cubit.dart';

sealed class AppThemeState extends Equatable {
  const AppThemeState();

  @override
  List<Object> get props => [];
}

final class AppThemeInitial extends AppThemeState {}

final class AppThemeLight extends AppThemeState {}

final class AppThemeDark extends AppThemeState {}
