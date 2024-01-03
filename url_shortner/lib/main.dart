import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/features/home/data/repos/home_repo_implement.dart';
import 'package:url_shortner/features/home/manger/get_url_cubit/get_url_cubit.dart';
import 'package:url_shortner/features/home/manger/save_urls_cubit/save_urls_cubit.dart';
import 'package:url_shortner/features/nav/nav_bar_page.dart';
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
  const MyApp({super.key});

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
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Url Shortner',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PagesWithNavigationBar(),
      ),
    );
  }
}
