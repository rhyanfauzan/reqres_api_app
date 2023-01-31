class UserDetailModel {
    UserDetailModel({
        this.data,
        this.support,
    });

    DataUser? data;
    Support? support;

    factory UserDetailModel.fromJson(Map<String, dynamic> json) => UserDetailModel(
        data: json["data"] == null ? null : DataUser.fromJson(json["data"]),
        support: json["support"] == null ? null : Support.fromJson(json["support"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "support": support?.toJson(),
    };
}

class DataUser {
    DataUser({
        this.id,
        this.email,
        this.firstName,
        this.lastName,
        this.avatar,
    });

    int? id;
    String? email;
    String? firstName;
    String? lastName;
    String? avatar;

    factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
    };
}

class Support {
    Support({
        this.url,
        this.text,
    });

    String? url;
    String? text;

    factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
    };
}
