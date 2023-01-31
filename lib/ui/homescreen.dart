// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:reqres_api_app/model/user_model.dart';
import 'package:reqres_api_app/ui/detailuser_screen.dart';
import 'package:skeletons/skeletons.dart';

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
              return const ShimmerLoading();
            }
          }),
    );
  }
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                const SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                      shape: BoxShape.rectangle, width: 50, height: 50),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 1,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 16,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width,
                            )),
                      ),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 1,
                            spacing: 6,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 6,
                              maxLength: MediaQuery.of(context).size.width,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
