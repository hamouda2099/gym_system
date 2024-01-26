// To parse this JSON data, do
//
//     final coachesModel = coachesModelFromJson(jsonString);

import 'dart:convert';

CoachesModel coachesModelFromJson(String str) =>
    CoachesModel.fromJson(json.decode(str));

String coachesModelToJson(CoachesModel data) => json.encode(data.toJson());

class CoachesModel {
  int? statusCode;
  String? message;
  List<Coach>? coaches;

  CoachesModel({
    this.statusCode,
    this.message,
    this.coaches,
  });

  factory CoachesModel.fromJson(Map<String, dynamic> json) => CoachesModel(
        statusCode: json["statusCode"],
        message: json["message"],
        coaches: json["coaches"] == null
            ? []
            : List<Coach>.from(json["coaches"]!.map((x) => Coach.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "coaches": coaches == null
            ? []
            : List<dynamic>.from(coaches!.map((x) => x.toJson())),
      };
}

class Coach {
  int? id;
  String? name;
  String? phone;
  String? password;
  int? hours;
  int? salary;
  String? role;
  int? suspended;
  String? createdAt;
  dynamic deletedAt;

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
      };
}
