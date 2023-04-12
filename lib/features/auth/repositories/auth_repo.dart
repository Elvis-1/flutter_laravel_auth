import 'package:flutter_laravel_auth/common/utils/constants.dart';
import 'package:flutter_laravel_auth/data/api_client.dart';
import 'package:flutter_laravel_auth/models/response_model.dart';
import 'package:flutter_laravel_auth/models/signup_body.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  ApiClient apiClient;

  AuthRepo({required this.apiClient, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  Future<bool> changePassword(password) async {
    return await sharedPreferences.setString('password', password);
  }

  // Future<bool> logout() async {
  //   await sharedPreferences.remove('password');
  //   return await sharedPreferences.remove('email');
  // }

  Future<bool> signup(email, password) async {
    try {
      var emailValue = await sharedPreferences.setString('email', email);
      var passwordValue =
          await sharedPreferences.setString('password', password);
      // Response $response = await apiClient.postData(
      //     AppConstants.USER_SIGN_UP, signupBody.toJson());
      // return $response;
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> login(email, password) async {
    try {
      // setUserTokenForLogin();
      var savedEmail = sharedPreferences.get('email');
      var savedPassword = sharedPreferences.get('password');

      if (savedEmail != email) {
        return false;
      }
      if (savedPassword != password) {
        return false;
      }
      return true;

      // Response response =
      //     await apiClient.postData(AppConstants.USER_SIGN_IN, body);
      // return response;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Future<bool> setLocallySavedToken() async {
  //   String userToken = getUserToken();
  //   return await sharedPreferences.setString(
  //       AppConstants.LOCAL_TOKEN, userToken);
  // }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);

    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? '';
  }

  bool isUserLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<Response> forgotPassword(body) async {
    Response response;
    try {
      response = await apiClient.postData(AppConstants.FORGOT_PASSWORD, body);
      return response;
    } catch (e) {
      response = Response(statusCode: 1, statusText: e.toString());
      return response;
    }
  }

  Future<Response> resetPassword(body) async {
    Response response;
    try {
      response = await apiClient.postData(AppConstants.RESET_PASSWORD, body);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
