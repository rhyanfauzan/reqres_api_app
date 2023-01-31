// To parse this JSON data, do
//
//     final createUserModel = createUserModelFromJson(jsonString);

import 'dart:convert';

CreateUserModel createUserModelFromJson(String str) => CreateUserModel.fromJson(json.decode(str));

String createUserModelToJson(CreateUserModel data) => json.encode(data.toJson());

class CreateUserModel {
    CreateUserModel({
        this.name,
        this.job,
        this.id,
        this.createdAt,
    });

    String? name;
    String? job;
    String? id;
    DateTime? createdAt;

    factory CreateUserModel.fromJson(Map<String, dynamic> json) => CreateUserModel(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
    };
}
