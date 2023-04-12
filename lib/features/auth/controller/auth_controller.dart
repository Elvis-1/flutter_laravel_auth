import 'package:flutter_laravel_auth/common/utils/constants.dart';
import 'package:flutter_laravel_auth/data/api_client.dart';
import 'package:flutter_laravel_auth/features/auth/repositories/auth_repo.dart';
import 'package:flutter_laravel_auth/models/signup_body.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/response_model.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  bool _isLoading = false;
  //late SharedPreferences sharedPreferences;

  bool get isLoading => _isLoading;

  AuthController({required this.authRepo});

  Future<bool> changePassword(password) async {
    return await authRepo.changePassword(password);
  }

  Future<ResponseModel> signup(email, password) async {
    _isLoading = true;
    update();
    ResponseModel responseModel;
    try {
      bool response = await authRepo.signup(email, password);
      if (response) {
        responseModel = ResponseModel('successful', true);
      } else {
        responseModel = ResponseModel('failed', false);
      }
    } catch (e) {
      responseModel = ResponseModel(e.toString(), false);
    }
    _isLoading = false;
    update();

    return responseModel;
  }

  Future<ResponseModel> login(email, password) async {
    _isLoading = true;
    update();
    ResponseModel responseModel;
    try {
      bool response = await authRepo.login(email, password);
      if (response) {
        responseModel = ResponseModel('logged in', true);
      } else {
        responseModel = ResponseModel('Failed', false);
      }
    } catch (e) {
      responseModel = ResponseModel(e.toString(), false);
      print(e.toString());
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  isUserLoggedIn() {
    return authRepo.isUserLoggedIn();
  }

  Future<ResponseModel> forgotPassword(email) async {
    Map<String, dynamic> emailBody = {'email': email};
    ResponseModel responseModel;
    _isLoading = true;
    update();
    Response response = await authRepo.forgotPassword(emailBody);
    if (response.statusCode == 200) {
      responseModel = ResponseModel('success', true);
    } else {
      responseModel = ResponseModel(response.statusText!, false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> resetPassword(body) async {
    _isLoading = true;

    update();
    ResponseModel responseModel;
    Response response = await authRepo.resetPassword(body);
    if (response.statusCode == 200) {
      responseModel = ResponseModel(response.statusText!, true);
    } else {
      responseModel = ResponseModel(response.statusText!, false);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}
