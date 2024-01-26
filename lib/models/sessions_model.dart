// To parse this JSON data, do
//
//     final sessionsModel = sessionsModelFromJson(jsonString);

import 'dart:convert';

SessionsModel sessionsModelFromJson(String str) =>
    SessionsModel.fromJson(json.decode(str));

String sessionsModelToJson(SessionsModel data) => json.encode(data.toJson());

class SessionsModel {
  int? statusCode;
  String? message;
  List<Session>? sessions;

  SessionsModel({
    this.statusCode,
    this.message,
    this.sessions,
  });

  factory SessionsModel.fromJson(Map<String, dynamic> json) => SessionsModel(
        statusCode: json["statusCode"],
        message: json["message"],
        sessions: json["sessions"] == null
            ? []
            : List<Session>.from(
                json["sessions"]!.map((x) => Session.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "sessions": sessions == null
            ? []
            : List<dynamic>.from(sessions!.map((x) => x.toJson())),
      };
}

class Session {
  int? id;
  String? name;
  int? cost;
  String? createdAt;
  dynamic deletedAt;

  Session({
    this.id,
    this.name,
    this.cost,
    this.createdAt,
    this.deletedAt,
  });

  factory Session.fromJson(Map<String, dynamic> json) => Session(
        id: json["id"],
        name: json["name"],
        cost: json["cost"],
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cost": cost,
        "created_at": createdAt,
        "deleted_at": deletedAt,
      };
}
