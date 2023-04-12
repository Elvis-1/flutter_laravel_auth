import 'package:flutter_laravel_auth/common/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  String appBaseUrl;
  late Map<String, String> _mainHeaders;
  final SharedPreferences sharedPreferences;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    timeout = Duration(seconds: 30);
    baseUrl = appBaseUrl;
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? '';

    _mainHeaders = {
      "Content-type": "application/json; charset-UTF=8",
      "Accept": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  Future<Response> postData(String uri, dynamic body) async {
    try {
      Response $response = await post(uri, body, headers: _mainHeaders);
      print($response.body);
      return $response;
    } catch (e) {
      print('in api client ' + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  updateHeader(String token) {
    _mainHeaders["Authorization"] = "Bearer $token";
  }
}
