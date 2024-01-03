import 'package:flutter/material.dart';
import 'package:url_shortner/features/all_urls/presentation/views/widgets/display_url_body.dart';

class DisplayUrlsView extends StatelessWidget {
  const DisplayUrlsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DisplayUrlsViewBody(),
    );
  }
}
