import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_shortner/features/all_urls/presentation/views/display_urls_view.dart';
import 'package:url_shortner/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:url_shortner/features/settings/presentation/views/setting_view.dart';

class PagesWithNavigationBar extends StatefulWidget {
  const PagesWithNavigationBar({Key? key}) : super(key: key);

  @override
  State<PagesWithNavigationBar> createState() => _PagesWithNavigationBarState();
}

class _PagesWithNavigationBarState extends State<PagesWithNavigationBar> {
  int _selectedScreenIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {"screen": const HomeViewBody(), "title": "Screen A Title"},
    {"screen": const DisplayUrlsView(), "title": "Screen B Title"},
    {"screen": const SettingPageView(), "title": "Screen C Title"},
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  void updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: "Home_page".tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.link), label: "Urls".tr()),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings), label: "Settings".tr()),
        ],
      ),
    );
  }
}
