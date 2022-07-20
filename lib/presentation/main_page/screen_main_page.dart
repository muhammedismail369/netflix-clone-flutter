import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/main_page/widgets/bottom_nav.dart';

import '../downloads/screen_downloads.dart';
// import '../fast_laugh/screen_fast_laugh.dart';
// import '../home/screen_home.dart';
// import '../new_and_hot/screen_new_and_hot.dart';
// import '../search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);

  final _pages = [
    // ScreenHome(),
    // ScreenNewAndHot(),
    // ScreenFastLaugh(),
    // ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
