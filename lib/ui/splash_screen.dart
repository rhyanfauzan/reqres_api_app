import 'package:flutter/material.dart';
import 'package:reqres_api_app/config/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/logoreqres.png',
          width: 150,
        ),
      ),
    );
  }
}
