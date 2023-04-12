import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/common/utils/colors.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/widgets/textfield.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  static const routeName = '/change-password-screen';
  var passwordController = TextEditingController();

  AuthController authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    // dialog box
    void _errorDialog(String message) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('An Errror Occurred'),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('okay'))
                ],
              )));
    }

    changePassword() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var password = passwordController.text;
      if (password.isEmpty) {
        _errorDialog('Password can not be empty');
        return;
      }

      var response = await authController.changePassword(password);
      if (response) {
        Get.snackbar('Success', 'Password Changed',
            backgroundColor: Colors.black, colorText: Colors.white);
        password = '';
        print(pref.get('password'));
        return;
      } else {
        _errorDialog('Error');
        return;
      }
    }

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Update Password',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: AuthTextField(
                      submit: () {},
                      action: TextInputAction.next,
                      obs: false,
                      inputkey: TextInputType.text,
                      label: 'New Password',
                      textControl: passwordController),
                ),
                TextButton(
                    onPressed: () {
                      changePassword();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: AppColors.mainColor),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
