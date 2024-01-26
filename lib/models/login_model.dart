// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int? statusCode;
  String? message;
  Coach? coach;

  LoginModel({
    this.statusCode,
    this.message,
    this.coach,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        statusCode: json["statusCode"],
        message: json["message"],
        coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "coach": coach?.toJson(),
      };
}

class Coach {
  String? id;
  String? name;
  String? phone;
  String? password;
  int? hours;
  int? salary;
  String? role;
  int? suspended;
  String? createdAt;
  dynamic deletedAt;
  String? tokenId;
  String? token;

  Coach({
    this.id,
    this.name,
    this.phone,
    this.password,
    this.hours,
    this.salary,
    this.role,
    this.suspended,
    this.createdAt,
    this.deletedAt,
    this.tokenId,
    this.token,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        password: json["password"],
        hours: json["hours"],
        salary: json["salary"],
        role: json["role"],
        suspended: json["suspended"],
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
        tokenId: json["tokenId"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "password": password,
        "hours": hours,
        "salary": salary,
        "role": role,
        "suspended": suspended,
        "created_at": createdAt,
        "deleted_at": deletedAt,
        "tokenId": tokenId,
        "token": token,
      };
}
