// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:reqres_api_app/model/user_model.dart';
import 'package:reqres_api_app/ui/detailuser_screen.dart';
import 'package:reqres_api_app/widgets/shimmer_list.dart';

import '../widgets/card_user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.futureUser});

  final Future<UserModel?> futureUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Users'),
      ),
      body: FutureBuilder<UserModel?>(
          future: futureUser,
          builder: (context, snapshot) {
            print(snapshot.data?.data?.length);
            if (snapshot.hasData) {
              print("hasData");
              var users = snapshot.data?.data;
              return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: users?.length,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailUserScreen(
                                      idUser:
                                          "${users?[index].id.toString()}")));
                        },
                        child: CardUser(
                          firstName: users?[index].firstName,
                          lastName: users?[index].lastName,
                          email: users?[index].email,
                          avatarUrl: users?[index].avatar,
                        ),
                      ));
            } else {
              print("Loading..");
              return const ShimmerListLoading();
            }
          }),
    );
  }
}

