import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_shortner/core/errors/enums/theme_state.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(AppThemeInitial());

  changeTheme(ThemeState state) {
    switch (state) {
      case ThemeState.initial:
        break;
      case ThemeState.light:
        emit(AppThemeLight());
        break;
      case ThemeState.dark:
        emit(AppThemeDark());
        break;
      default:
    }
  }
}
