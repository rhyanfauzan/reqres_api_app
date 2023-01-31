// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:reqres_api_app/config/theme.dart';

import '../config/app_asset.dart';

class CardUser extends StatelessWidget {
  CardUser({
    Key? key,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.avatarUrl,
  }) : super(key: key);

  String? firstName;
  String? lastName;
  String? email;
  String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            avatarUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      "$avatarUrl",
                      width: 60,
                      height: 60,
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
                  '$firstName $lastName',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
                Text(
                  '$email',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: greyTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ],
        ));
  }
}
