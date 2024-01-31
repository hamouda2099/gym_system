// To parse this JSON data, do
//
//     final subscriptionModel = subscriptionModelFromJson(jsonString);

import 'dart:convert';

SubscriptionModel subscriptionModelFromJson(String str) =>
    SubscriptionModel.fromJson(json.decode(str));

String subscriptionModelToJson(SubscriptionModel data) =>
    json.encode(data.toJson());

class SubscriptionModel {
  int? statusCode;
  String? message;
  Subscription? subscription;

  SubscriptionModel({
    this.statusCode,
    this.message,
    this.subscription,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      SubscriptionModel(
        statusCode: json["statusCode"],
        message: json["message"],
        subscription: json["subscription"] == null
            ? null
            : Subscription.fromJson(json["subscription"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "subscription": subscription?.toJson(),
      };
}

class Subscription {
  num? id;
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
  Coach? coach;

  Subscription({
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
    this.coach,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
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
        coach: json["coach"] == null ? null : Coach.fromJson(json["coach"]),
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
        "coach": coach?.toJson(),
      };
}

class Coach {
  int? id;
  String? name;
  String? phone;

  Coach({
    this.id,
    this.name,
    this.phone,
  });

  factory Coach.fromJson(Map<String, dynamic> json) => Coach(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
      };
}
