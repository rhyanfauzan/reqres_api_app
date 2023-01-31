// ignore_for_file: avoid_print, override_on_non_overriding_member

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:reqres_api_app/model/user_model.dart';
import 'package:reqres_api_app/model/userdetail_model.dart';

import '../model/createuser_mode.dart';

class UserService {
  String baseUrl = "https://reqres.in/api/users/";
  // Get User
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

  // Get Detail User
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

  // Create User
  @override
  Future<CreateUserModel?> createUser(String name, String job) async {
    Response response;
    var dio = Dio();
    dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true, error: true));
    try {
      response = await dio.post(baseUrl, data: {'name': name, 'job': job});
      print("berhasil create User");
      return CreateUserModel.fromJson(response.data);
    } on DioError catch (e) {
      print("gagal create User");
      return CreateUserModel.fromJson(e.response?.data);
    }
  }
}
