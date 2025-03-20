// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    bool? status;
    String? message;
    User? user;

    SignupModel({
        this.status,
        this.message,
        this.user,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user!.toJson(),
    };
}

class User {
    String? name;
    String? email;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;

    User({
        this.name,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "id": id,
    };
}
