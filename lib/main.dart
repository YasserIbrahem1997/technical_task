import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view_model/popular_cubit/popular_cubit.dart';
import 'view/screen/main_screen/main_screen.dart';
import 'view_model/bottom_nav_cubit/bottom_nav__cubit.dart';
import 'view_model/latest_badges_cubit/get_latest_badges_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool startButtonClicked = prefs.getBool("startButtonClicked") ?? false;

  runApp(MyApp(startButtonClicked: startButtonClicked));
}

class MyApp extends StatelessWidget {
  final bool startButtonClicked;

  const MyApp({Key? key, required this.startButtonClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> NavigationCubit(startButtonClicked)),
        BlocProvider(create: (_)=> GetLatestBadgesCubit()..loadImages()),
        BlocProvider(create: (_)=> GetPopularCubit()..loadImages()),
      ],
      child: MaterialApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          textTheme: GoogleFonts.balooBhaijaan2TextTheme(), // Apply globally
          scaffoldBackgroundColor: Colors.white,
        ),
        home: MainScreen(),
      ),
    );
  }
}
