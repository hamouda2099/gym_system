// To parse this JSON data, do
//
//     final subscriptionsModel = subscriptionsModelFromJson(jsonString);

import 'dart:convert';

SubscriptionsModel subscriptionsModelFromJson(String str) =>
    SubscriptionsModel.fromJson(json.decode(str));

String subscriptionsModelToJson(SubscriptionsModel data) =>
    json.encode(data.toJson());

class SubscriptionsModel {
  int? statusCode;
  String? message;
  List<Subscribtion>? subscribtions;

  SubscriptionsModel({
    this.statusCode,
    this.message,
    this.subscribtions,
  });

  factory SubscriptionsModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionsModel(
        statusCode: json["statusCode"],
        message: json["message"],
        subscribtions: json["subscribtions"] == null
            ? []
            : List<Subscribtion>.from(
                json["subscribtions"]!.map((x) => Subscribtion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "subscribtions": subscribtions == null
            ? []
            : List<dynamic>.from(subscribtions!.map((x) => x.toJson())),
      };
}

class Subscribtion {
  int? id;
  String? name;
  String? phone;
  String? status;
  String? startDate;
  String? endDate;
  num? price;
  num? paid;
  num? offer;
  num? coachId;
  String? createdAt;
  String? deletedAt;

  Subscribtion({
    this.id,
    this.name,
    this.phone,
    this.status,
    this.startDate,
    this.endDate,
    this.price,
    this.paid,
    this.offer,
    this.coachId,
    this.createdAt,
    this.deletedAt,
  });

  factory Subscribtion.fromJson(Map<String, dynamic> json) => Subscribtion(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        status: json["status"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        price: json["price"],
        paid: json["paid"],
        offer: json["offer"],
        coachId: json["coach_id"],
        createdAt: json["created_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "status": status,
        "start_date": startDate,
        "end_date": endDate,
        "price": price,
        "paid": paid,
        "offer": offer,
        "coach_id": coachId,
        "created_at": createdAt,
        "deleted_at": deletedAt,
      };
}
