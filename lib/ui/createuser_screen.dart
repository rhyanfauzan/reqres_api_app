// ignore_for_file: unused_element, must_be_immutable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:reqres_api_app/model/createuser_mode.dart';
import 'package:reqres_api_app/widgets/buttons.dart';

import '../config/theme.dart';
import '../service/user_service.dart';
import '../widgets/custom_form_field.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({super.key});

  final nameController = TextEditingController(text: 'Alex');
  final jobController = TextEditingController(text: 'Freelance');
  UserService userService = UserService();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Function Create User
    createUser() async {
      if (formKey.currentState!.validate()) {
        CreateUserModel? user = await userService.createUser(
            nameController.text, jobController.text);
        if (user != null) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0)), //this right here
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: lightBackgroundColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'New User,\nName: ${user.name}\nJob: ${user.job}\nid: ${user.id}\ncreated_at: ${user.createdAt}',
                            style: greyTextStyle,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomFilledButton(
                            title: "Ok",
                            width: 100,
                            fontColor: whiteColor,
                            bgColor: greyColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
          print('Berhasil Create!');
          var snackBar = SnackBar(
            backgroundColor: greenColor,
            content: Text(
              "Berhasil New User",
              style: whiteTextStyle,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          print('Gagal Create');
          var snackBar = SnackBar(
            backgroundColor: redColor,
            content: Text(
              "Masukan data dengan benar",
              style: whiteTextStyle,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("New User"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                title: 'Name',
                controller: nameController,
                isShowTitle: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomFormField(
                title: 'Job',
                controller: jobController,
                isShowTitle: false,
              ),
              const Spacer(),
              CustomFilledButton(
                title: 'Create',
                onPressed: () {
                  createUser();
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
