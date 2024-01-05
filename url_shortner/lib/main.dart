import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_shortner/core/errors/enums/theme_state.dart';
import 'package:url_shortner/features/home/data/repos/home_repo_implement.dart';
import 'package:url_shortner/features/home/manger/get_url_cubit/get_url_cubit.dart';
import 'package:url_shortner/features/home/manger/save_urls_cubit/save_urls_cubit.dart';
import 'package:url_shortner/features/nav/nav_bar_page.dart';
import 'package:url_shortner/features/theme_cubit/app_theme_cubit.dart';
import 'package:url_shortner/utils/service_locator.dart';

void main() {
  setup();
  runApp(
    EasyLocalization(
      startLocale: const Locale('en'),
      saveLocale: true,
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetUrlCubit(
            getIt.get<HomeRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => SaveUrlsCubit(),
        ),
        BlocProvider(
          create: (context) => AppThemeCubit()..changeTheme(ThemeState.initial),
        ),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Url_Shortner'.tr(),
            debugShowCheckedModeBanner: false,
            theme: _buildTheme(themeState),
            home: const PagesWithNavigationBar(),
          );
        },
      ),
    );
  }

  ThemeData _buildTheme(AppThemeState themeState) {
    if (themeState is AppThemeLight) {
      return ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.black,
        ),
      );
    } else if (themeState is AppThemeDark) {
      return ThemeData.dark(useMaterial3: true).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
        ),
      );
    }
    return ThemeData.light(useMaterial3: true).copyWith(
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: Colors.black,
      ),
    );
  }
}
