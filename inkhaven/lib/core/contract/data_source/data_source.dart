import 'dart:convert';

import 'package:inkhaven/core/entity/core_entity/request.dart';

import '../../entity/core_entity/response.dart';
import '../../entity/failure/failure.dart';
import '../../entity/token_entity/token_entity.dart';
import 'package:http/http.dart' as http;

///Enum for request types required by [DataSource.sendRequestToServer]
enum HttpRequestType { get, post, delete }

typedef HttpRequestRegister = ({
  String url,
  Map<String, String> headers,
  Request? body,
  HttpRequestType type
});

abstract class DataSource {
  final http.Client _client;
  DataSource({required http.Client client}) : _client = client;

  ///Method for sending request to server and parsing response
  Future<Response> sendRequestToServer(
      {required TokenModel tokenModel,
      required HttpRequestRegister requestData,
      required Response Function(Map<String, dynamic> json) onSuccess}) async {
    late http.Response serverQueryResult;
    switch (requestData.type) {
      case HttpRequestType.get:
        serverQueryResult = await _client.get(Uri.parse(requestData.url),
            headers: requestData.headers.containsKey('Authorization')
                ? requestData.headers
                : {'Authorization': tokenModel.getAccessToken}
              ..addAll(requestData.headers));
        break;
      case HttpRequestType.post:
        serverQueryResult = await _client.post(Uri.parse(requestData.url),
            headers: requestData.headers.containsKey('Authorization')
                ? requestData.headers
                : {'Authorization': tokenModel.getAccessToken}
              ..addAll(requestData.headers),
            body: requestData.body != null
                ? json.encode(requestData.body)
                : null);
      case HttpRequestType.delete:
        serverQueryResult = await _client.delete(Uri.parse(requestData.url),
            headers: requestData.headers.containsKey('Authorization')
                ? requestData.headers
                : {'Authorization': tokenModel.getAccessToken}
              ..addAll(requestData.headers),
            body: requestData.body != null
                ? json.encode(requestData.body)
                : null);
      default:
        break;
    }
    if (serverQueryResult.statusCode == 200) {
      return onSuccess(json.decode(serverQueryResult.body));
    } else if (serverQueryResult.statusCode == 401) {
      throw AuthFailure();
    } else {
      throw ServerFailure();
    }
  }
}
