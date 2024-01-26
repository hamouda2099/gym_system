import 'dart:convert';

import 'package:gym_system/config/user_data.dart';
import 'package:gym_system/models/sessions_model.dart';
import 'package:http/http.dart' as http;

import '../../config/constants.dart';
import '../../models/coaches_model.dart';
import '../../models/subscriptions_model.dart';

class ApiManger {
  static const String baseUrl = 'http://localhost:4000';
  static const String _login = '$baseUrl/login';
  static const String _sessions = '$baseUrl/sessions';
  static const String _coaches = '$baseUrl/coaches';
  static const String _subscriptions = '$baseUrl/subscriptions';

  static String toQuery(Map<String, dynamic> parameters) {
    try {
      parameters.removeWhere((key, value) =>
          key.toString().isEmpty || value.toString().isEmpty || value == null);
    } catch (_) {}
    return '?${Uri(
      queryParameters: parameters,
    ).query}';
  }

  static Future<Map<String, dynamic>> sendPostRequest(
    String url,
    Map parameters,
  ) async {
    try {
      parameters.removeWhere((key, value) =>
          value == null || key.toString().isEmpty || value.toString().isEmpty);
    } catch (_) {}

    http.Response res = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': '${User.coach?.token}',
        'accept-language': localLanguage,
      },
      body: jsonEncode(parameters),
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    return body;
  }

  static Future<http.Response> sendGetRequest(
    String url,
  ) async {
    return http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': '${User.coach?.token}',
        'accept-language': localLanguage,
      },
    );
  }

  static Future<http.Response> sendDeleteRequest(String url,
      {Map? parameters}) async {
    return await http.delete(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': '${User.coach?.token}',
        },
        body: parameters == null ? null : jsonEncode(parameters));
  }

  static Future<Map<String, dynamic>> sendPutRequest(
    String url,
    Map parameters,
  ) async {
    try {
      parameters.removeWhere((key, value) =>
          key == null ||
          value == null ||
          key.toString().isEmpty ||
          value.toString().isEmpty);
    } catch (_) {}

    http.Response res = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'token': '${User.coach?.token}',
        'accept-language': localLanguage ?? 'en',
      },
      body: jsonEncode(parameters),
    );
    Map<String, dynamic> body = jsonDecode(res.body);
    body['status'] = res.statusCode;
    return body;
  }

  /// ------------------------------------------------------

  static Future<dynamic> login({
    String? name,
    String? password,
  }) async {
    Map<String, dynamic> parameters = {
      'name': name,
      'password': password,
    };
    return await sendPostRequest(_login, parameters);
  }

  static Future<dynamic> createCoach({
    String? name,
    String? phone,
    String? hours,
    String? salary,
    String? password,
    String? role,
  }) async {
    Map<String, dynamic> parameters = {
      "name": name,
      "phone": phone,
      "hours": hours,
      "salary": salary,
      "password": password,
      "role": "coach",
    };
    return await sendPostRequest(_coaches, parameters);
  }

  static Future<CoachesModel> getCoaches({
    String page = '1',
    String limit = '10',
    String? query,
  }) async {
    Map<String, dynamic> parameters = {
      "page": page,
      "limit": limit,
      "query": query,
    };
    return CoachesModel.fromJson(json
        .decode((await sendGetRequest(_coaches + toQuery(parameters))).body));
  }

  static Future<dynamic> createSession({
    String? name,
    num? cost,
  }) async {
    Map<String, dynamic> parameters = {
      "name": name,
      "cost": cost,
    };
    return await sendPostRequest(_sessions, parameters);
  }

  static Future<SessionsModel> getSessions({
    String page = '1',
    String limit = '10',
    String? query,
  }) async {
    Map<String, dynamic> parameters = {
      "page": page,
      "limit": limit,
      "query": query,
    };
    return SessionsModel.fromJson(json
        .decode((await sendGetRequest(_sessions + toQuery(parameters))).body));
  }

  static Future<dynamic> createSubscription({
    String? fullName,
    String? phone,
    String? startDate,
    String? endDate,
    String? price,
    String? paid,
  }) async {
    Map<String, dynamic> parameters = {
      "name": fullName,
      "phone": phone,
      "startDate": startDate,
      "endDate": endDate,
      "price": price,
      "paid": paid,
    };
    return await sendPostRequest(_subscriptions, parameters);
  }

  static Future<SubscriptionsModel> getSubscriptions({
    String page = '1',
    String limit = '10',
    String? query,
  }) async {
    Map<String, dynamic> parameters = {
      "page": page,
      "limit": limit,
      "query": query,
    };
    return SubscriptionsModel.fromJson(json.decode(
        (await sendGetRequest(_subscriptions + toQuery(parameters))).body));
  }
}
