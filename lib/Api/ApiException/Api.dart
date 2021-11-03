import 'dart:convert';
import 'dart:io';
import 'package:myapp/Api/ApiException/AppException.dart';
import 'package:myapp/globals.dart' as globals;
import 'package:http/http.dart' as http;

class Api {
  static Future<dynamic> getRequestData(String url) async {
    String apiUrl = globals.APIURL + url;
    print(apiUrl);
    var responseJson;
    try {
      String token = '';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      print(token);
      responseJson = _returnListResponse(response);
      return responseJson;
    } on SocketException {
      print('Socket Exception');
      throw FetchDataException("No Internet Available");
    }
  }

  static Future<dynamic> postRequestData(String url, dynamic body,
      {bool sendToken = false}) async {
    String apiUrl = globals.APIURL + url;
    print(url);
    var responseJson;
    try {
      String token = '';
      var response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(body),
        headers: sendToken
            ? {
                'Content-type': 'application/json',
                'Authorization': 'Bearer $token',
              }
            : {
                'Content-type': 'application/json',
              },
      );
      responseJson = _returnListResponse(response);
      return responseJson;
    } on SocketException {
      throw FetchDataException("No Internet Available");
    }
  }
}

dynamic _returnListResponse(http.Response response) {
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
      throw UnauthorisedException(response.body.toString());
    case 404:
      throw RequestNotFoundException(response.body.toString());
    case 403:
      throw UnautorizationException(response.body.toString());
    case 500:
      throw InternalServerException(response.body.toString());
    case 503:
      throw ServerNotFoundException(response.body.toString());
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
