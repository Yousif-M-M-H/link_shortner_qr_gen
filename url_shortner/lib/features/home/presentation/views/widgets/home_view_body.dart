import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_shortner/features/home/presentation/views/widgets/home_page_introduction.dart';
import 'package:url_shortner/features/home/presentation/views/widgets/shorten_link_button.dart';
import 'package:url_shortner/features/home/presentation/views/widgets/url_text_field.dart';
import 'package:url_shortner/features/home/manger/get_url_cubit/get_url_cubit.dart';
import 'package:url_shortner/features/home/manger/save_urls_cubit/save_urls_cubit.dart';
import 'package:url_shortner/utils/snackbars/success_snackbar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final longUrlController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    longUrlController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url shortener"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HomePageIntroduction(),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: UrlTextField(longUrlController: longUrlController),
              ),
              ShortenLinkButton(
                onPressed: () async {
                  final longUrl = longUrlController.text;
                  if (longUrl.isNotEmpty) {
                    final getUrlCubit = BlocProvider.of<GetUrlCubit>(context);
                    await getUrlCubit.getShortUrl(longUrl);

                    final getUrlState = getUrlCubit.state;
                    if (getUrlState is GetUrlSuccess) {
                      longUrlController.text = '';
                      final shortUrl = getUrlState.urls[0].resultUrl ?? '';
                      BlocProvider.of<SaveUrlsCubit>(context)
                          .saveUrls(shortUrl, longUrl);

                      SnackbarHelper.showShortenedUrlSnackbar(context);
                    } else if (getUrlState is GetUrlFailure) {
                      SnackbarHelper.showShortenedUrlSnackbarFailure(context);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
