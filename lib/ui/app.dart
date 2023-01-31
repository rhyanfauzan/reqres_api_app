// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:reqres_api_app/config/theme.dart';
import 'package:reqres_api_app/ui/about_screen.dart';
import 'package:reqres_api_app/ui/createuser_screen.dart';
import 'package:reqres_api_app/ui/homescreen.dart';

import '../model/user_model.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.futureUser}) : super(key: key);
  final Future<UserModel?> futureUser;

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return [
        HomeScreen(
          futureUser: futureUser,
        ),
        CreateUserScreen(),
        const AboutScreen(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_filled),
          title: ("Home"),
          inactiveIcon: Icon(
            Icons.home_outlined,
            color: blue400Color,
          ),
          activeColorPrimary: blue400Color,
          inactiveColorPrimary: greyColor,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(
            Icons.add_circle_rounded,
            color: whiteColor,
          ),
          inactiveIcon: Icon(
            Icons.add_circle_outline,
            color: whiteColor,
          ),
          activeColorPrimary: blue400Color,
          inactiveColorPrimary: greyColor,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.info_rounded),
          title: ("About"),
          inactiveIcon: Icon(
            Icons.info_outline_rounded,
            color: blue400Color,
          ),
          activeColorPrimary: blue400Color,
          inactiveColorPrimary: greyColor,
        ),
      ];
    }

    PersistentTabController controller;

    controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(),
      controller: controller,
      confineInSafeArea: true,
      backgroundColor: whiteColor,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: whiteColor,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen3')),
      body: const Center(
        child: Text(
          'Screen3',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class Screen5 extends StatelessWidget {
  const Screen5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen5')),
      body: const Center(
        child: Text(
          'Screen5',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
