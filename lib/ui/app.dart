// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:reqres_api_app/config/theme.dart';
import 'package:reqres_api_app/ui/about_screen.dart';
import 'package:reqres_api_app/ui/createuser_screen.dart';
import 'package:reqres_api_app/ui/homescreen.dart';
import 'package:bottom_bar/bottom_bar.dart';

import '../model/user_model.dart';
import '../service/user_service.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentPage = 0;
  final _pageController = PageController();
  late Future<UserModel?> futureUser;
  UserService userService = UserService();

  @override
  void initState() {
    setState(() {
      futureUser = userService.getUsers();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomeScreen(
            futureUser: futureUser,
          ),
          CreateUserScreen(
            futureUser: futureUser,
          ),
          const AboutScreen(),
        ],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
              icon: Icon(Icons.home,
                  color: _currentPage == 0 ? whiteColor : greyColor),
              title: Text(
                'Home',
                style: whiteTextStyle,
              ),
              activeColor: primaryColor,
              backgroundColorOpacity: 1,
              activeTitleColor: whiteColor),
          BottomBarItem(
              icon: Icon(Icons.add_circle,
                  color: _currentPage == 1 ? whiteColor : greyColor),
              title: Text(
                'New User',
                style: whiteTextStyle,
              ),
              activeColor: primaryColor,
              backgroundColorOpacity: 1,
              activeTitleColor: whiteColor),
          BottomBarItem(
              icon: Icon(Icons.info_outline,
                  color: _currentPage == 2 ? whiteColor : greyColor),
              title: Text(
                'About',
                style: whiteTextStyle,
              ),
              activeColor: primaryColor,
              backgroundColorOpacity: 1,
              activeTitleColor: whiteColor),
        ],
      ),
    );
  }
}
