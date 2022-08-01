import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/application/downloads/downloads_bloc.dart';
import 'package:netflix_clone/presentation/main_page/screen_main_page.dart';

import 'application/fast_laugh/fast_laugh_bloc.dart';
import 'application/hot_and_new/hot_and_new_bloc.dart';
import 'application/search/search_bloc.dart';
import 'core/colors/colors.dart';
import 'domain/core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastLaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotAndNewBloc>()),
      ],
      child: MaterialApp(
        title: "Netflix App",
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
            ),
            primarySwatch: Colors.blue,
            backgroundColor: Colors.black,
            scaffoldBackgroundColor: backgroundColor,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme: const TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
              ),
              bodyText2: TextStyle(
                color: Colors.white,
              ),
            )),
        home: ScreenMainPage(),
      ),
    );
  }
}
