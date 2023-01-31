// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:reqres_api_app/model/user_model.dart';
import 'package:reqres_api_app/model/userdetail_model.dart';

class UserService {
  String baseUrl = "https://reqres.in/api/users/";
  // User
  @override
  Future<UserModel?> getUsers() async {
    Response response;
    var dio = Dio();
    // dio.interceptors.add(
    //     LogInterceptor(requestBody: true, responseBody: true, error: true));
    try {
      response = await dio.get(
        baseUrl,
      );
      print("berhasil fetch User");
      return UserModel.fromJson(response.data);
    } on DioError catch (e) {
      print("gagal fetch User");
      return UserModel.fromJson(e.response?.data);
    }
  }

  // Detail User
  @override
  Future<UserDetailModel?> getDetailUser(String idUser) async {
    Response response;
    var dio = Dio();
    // dio.interceptors.add(
    //     LogInterceptor(requestBody: true, responseBody: true, error: true));
    try {
      response = await dio.get(
        baseUrl + idUser,
      );
      print("berhasil fetch User");
      return UserDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      print("gagal fetch User");
      return UserDetailModel.fromJson(e.response?.data);
    }
  }
}
