import 'package:flutter/material.dart';
import 'package:reqres_api_app/config/theme.dart';
import '../config/app_asset.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [HeaderProfile(), Content()],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: blackTextStyle.copyWith(fontWeight: bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "About this app Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            textAlign: TextAlign.justify,
            style: blackTextStyle.copyWith(fontWeight: regular, fontSize: 14),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: darkColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "(021) 6969 6666",
                style: blackTextStyle,
              )
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: darkColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Jalan. 46, Kota Silicon Valley - Indonesia",
                style: blackTextStyle,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {},
                child: Icon(
                  Icons.whatsapp,
                  color: greenColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.facebook_outlined,
                color: blue400Color,
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.email_outlined,
                color: redColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            alignment: Alignment.topRight,
            child: Icon(
              Icons.settings_outlined,
              size: 24,
              color: whiteColor,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.asset(
                  AppAsset.logolauncher,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
