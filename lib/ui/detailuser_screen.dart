// ignore_for_file: no_logic_in_create_state, avoid_print

import 'package:flutter/material.dart';
import 'package:reqres_api_app/model/userdetail_model.dart';

import '../config/app_asset.dart';
import '../config/theme.dart';
import '../service/user_service.dart';
import 'package:skeletons/skeletons.dart';

class DetailUserScreen extends StatefulWidget {
  const DetailUserScreen({super.key, required this.idUser});
  final String idUser;

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState(idUser);
}

class _DetailUserScreenState extends State<DetailUserScreen> {
  _DetailUserScreenState(this.idUser);

  late Future<UserDetailModel?> futureUserDetail;
  UserService userService = UserService();

  String idUser;

  @override
  void initState() {
    setState(() {
      futureUserDetail = userService.getDetailUser(idUser);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
      ),
      body: FutureBuilder<UserDetailModel?>(
          future: futureUserDetail,
          builder: (context, snapshot) {
            print(snapshot.data?.data?.firstName);
            if (snapshot.hasData) {
              print("hasData, detail user");
              var users = snapshot.data?.data;
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Row(
                    children: [
                      users?.avatar != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                "${users?.avatar}",
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                AppAsset.user,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${users?.firstName} ${users?.lastName}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: blackTextStyle.copyWith(fontSize: 24),
                          ),
                          Text(
                            '${users?.email}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: greyTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    color: greyColor,
                    height: 1,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  Text(
                    "Support",
                    style:
                        blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "${snapshot.data?.support?.text}",
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              );
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
    return SkeletonItem(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
          Row(
            children: [
              const SkeletonAvatar(
                style: SkeletonAvatarStyle(
                    shape: BoxShape.rectangle, width: 90, height: 90),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    SkeletonParagraph(
                      style: SkeletonParagraphStyle(
                          lines: 1,
                          spacing: 6,
                          lineStyle: SkeletonLineStyle(
                            randomLength: true,
                            height: 20,
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
          const SizedBox(
            height: 20,
          ),
          SkeletonParagraph(
            style: SkeletonParagraphStyle(
                lines: 1,
                spacing: 6,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 20,
                  borderRadius: BorderRadius.circular(8),
                  minLength: MediaQuery.of(context).size.width / 6,
                  maxLength: MediaQuery.of(context).size.width / 3,
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
        ]));
  }
}
