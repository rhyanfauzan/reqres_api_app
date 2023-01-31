import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres_api_app/ui/app.dart';
import 'package:reqres_api_app/ui/splash_screen.dart';

import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackgroundColor,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          titleTextStyle: blackTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
      ),
      home: Builder(builder: (context) {
        Future.delayed(const Duration(seconds: 2)).then((value) => {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const App()))
            });
        return const SplashScreen();
      }),
    );
  }
}
