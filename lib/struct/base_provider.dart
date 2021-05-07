import 'dart:convert';

import 'package:get/get.dart';

abstract class BaseProvider<T> extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.defaultDecoder = fromJsonData();
    httpClient.baseUrl = 'https://api.covid19api.com';
    // baseUrl = 'https://api.covid19api.com'; // It define baseUrl to
    // Http and websockets if used with no [httpClient] instance

    // It's will attach 'apikey' property on header from all requests
    String username = 'naruto';
    String password = 'bvM9pmEEQ7tfPZdC';
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    httpClient.addRequestModifier((request) {
      request.headers['apikey'] = '12345678';
      return request;
    });

    httpClient.addAuthenticator((request) async {
      final response = await get("http://yourapi/token");
//      final token = response.body['token'];
      // Set the header
//      request.headers['Authorization'] = "$token";
      return request;
    });

    //Autenticator will be called 3 times if HttpStatus is
    //HttpStatus.unauthorized
    httpClient.maxAuthRetries = 3;
  }

  Decoder fromJsonData();
}
