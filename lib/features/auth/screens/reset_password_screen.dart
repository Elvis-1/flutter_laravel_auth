import "package:flutter/material.dart";
import 'package:flutter_laravel_auth/common/utils/circular_progress_indicator.dart';
import 'package:flutter_laravel_auth/common/utils/dimensions.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/screens/auth_screen.dart';
import 'package:flutter_laravel_auth/models/new_password_model.dart';
import 'package:flutter_laravel_auth/models/response_model.dart';
import 'package:get/get.dart';

import '../../../common/utils/colors.dart';
import '../widgets/textfield.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  static const routeName = '/reset-password-screen';

  var emailController = TextEditingController();
  var newPasswordController = TextEditingController();
  var newPasswordConfirmController = TextEditingController();
  var codeController = TextEditingController();
  // dialog box
  void _errorDialog(String message, context) {
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

  resetPassword(AuthController authController, ctx) async {
    var email = emailController.text;
    var newPassword = newPasswordController.text;
    var newPasswordConfirm = newPasswordConfirmController.text;
    var code = codeController.text;

    if (email.isEmpty) {
      _errorDialog('Email can not be empty', ctx);
      return;
    } else if (!email.isEmail) {
      _errorDialog('Email must be correctly formed', ctx);
      return;
    } else if (newPassword.isEmpty) {
      _errorDialog('Password can not be empty', ctx);
      return;
    } else if (newPasswordConfirm.isEmpty) {
      _errorDialog('Password can not be empty', ctx);
      return;
    } else if (newPassword.length < 8) {
      _errorDialog('Password can not be less than 6 characters', ctx);
      return;
    } else if (newPassword != newPasswordConfirm) {
      _errorDialog('New Password must be equal to new password confirm ', ctx);
      return;
    } else {
      NewPasswordModel newPasswordModel;
      newPasswordModel = NewPasswordModel(
          email: email,
          password: newPassword,
          passwordConfirm: newPasswordConfirm,
          code: code);
      ResponseModel responseModel =
          await authController.resetPassword(newPasswordModel.toJson());
      if (responseModel.isSuccess) {
        Get.toNamed(AuthScreen.routeName);
      } else {
        _errorDialog(responseModel.message, ctx);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<AuthController>(
      builder: (authController) {
        return !authController.isLoading
            ? SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        // FORM FIELD
                        Form(
                          child: Column(
                            children: [
                              // EMAIL
                              AuthTextField(
                                // initialVal: arg.email,
                                action: TextInputAction.next,
                                obs: false,
                                inputkey: TextInputType.emailAddress,
                                label: 'Email Address',
                                textControl: emailController,
                                submit: () {},
                              ),
                              SizedBox(
                                height: Dimension.height20,
                              ),
                              // password
                              AuthTextField(
                                action: TextInputAction.next,
                                obs: true,
                                inputkey: TextInputType.text,
                                label: 'new password',
                                textControl: newPasswordController,
                                submit: () {},
                              ),
                              SizedBox(
                                height: Dimension.height20,
                              ),
                              // password confirm
                              AuthTextField(
                                action: TextInputAction.next,
                                obs: true,
                                inputkey: TextInputType.text,
                                label: 'confirm password',
                                textControl: newPasswordConfirmController,
                                submit: () {},
                              ),
                              SizedBox(
                                height: Dimension.height20,
                              ),
                              AuthTextField(
                                action: TextInputAction.done,
                                obs: false,
                                inputkey: TextInputType.text,
                                label: 'code',
                                textControl: codeController,
                                submit: () {
                                  resetPassword(authController, context);
                                },
                              ),
                              SizedBox(
                                height: Dimension.height20,
                              ),
                              // BUTTON
                              Container(
                                height: Dimension.height50,
                                width: Dimension.height50 * 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimension.radius20 / 4),
                                    color: AppColors.buttonColor),
                                child: TextButton(
                                  child: Text(
                                    'Change',
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                  onPressed: () =>
                                      resetPassword(authController, context),
                                  // ? Get.to(TabsScreen())
                                  // : Get.to(TabsScreen()),
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: Dimension.width30,
                                  //     vertical: Dimension.width20 / 5),
                                  // materialTapTargetSize:
                                  //     MaterialTapTargetSize.shrinkWrap,
                                  // textColor: Theme.of(context).primaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Back to login?',
                                    style: TextStyle(),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.toNamed(AuthScreen.routeName);
                                      },
                                      child: Text(
                                        'Login',
                                        style:
                                            TextStyle(color: Colors.redAccent),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : ProgressIndicatorWidget();
      },
    ));
  }
}
