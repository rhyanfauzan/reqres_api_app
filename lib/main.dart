import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reqres_api_app/model/user_model.dart';
import 'package:reqres_api_app/service/user_service.dart';
import 'package:reqres_api_app/ui/app.dart';
import 'package:reqres_api_app/ui/splash_screen.dart';

import 'config/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<UserModel?> futureUser;
  UserService userService = UserService();
  bool showSplash = true;

  @override
  void initState() {
    setState(() {
      futureUser = userService.getUsers();
    });

    super.initState();
  }

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => App(
                            futureUser: futureUser,
                          )))
            });
        return const SplashScreen();
      }),
    );
  }
}
