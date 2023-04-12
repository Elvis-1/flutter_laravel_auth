import 'package:flutter_laravel_auth/common/utils/constants.dart';
import 'package:flutter_laravel_auth/data/api_client.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/repositories/auth_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  // api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.APP_BASE_URL, sharedPreferences: Get.find()));

  // repos
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  // controllers
  Get.lazyPut(() => AuthController(
        authRepo: Get.find(),
      ));
}
