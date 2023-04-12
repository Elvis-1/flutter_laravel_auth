import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/common/utils/circular_progress_indicator.dart';
import 'package:flutter_laravel_auth/common/utils/colors.dart';
import 'package:flutter_laravel_auth/common/utils/dimensions.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/screens/reset_password_screen.dart';
import 'package:flutter_laravel_auth/features/auth/widgets/textfield.dart';
import 'package:flutter_laravel_auth/models/response_model.dart';

import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  static const routeName = '/forgot-password-screen';
  var emailController = TextEditingController();

  void _errorDialog(String message, context) {
    showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: const Text('An Errror Occurred'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Get.back(), child: const Text('okay'))
              ],
            )));
  }

  forgotPassword(AuthController authController, ctx) async {
    var email = emailController.text;

    ResponseModel responseModel;
    if (email.isEmpty) {
      _errorDialog('Email cannot be empty', ctx);
      return;
    } else if (!email.isEmail) {
      _errorDialog('Email must be a correct email', ctx);
      return;
    }
    responseModel = await authController.forgotPassword(email);
    if (responseModel.isSuccess) {
      Get.showSnackbar(GetSnackBar(
        title: 'Update',
        message: 'A code has been sent to your email',
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 10),
      ));
      Get.toNamed(ResetPasswordScreen.routeName, arguments: {
        'email': email,
      });
    } else {
      _errorDialog(responseModel.message, ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            //leading: ,
            actions: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.mainColor,
                  )),
              Expanded(child: Container())
            ]),
        body: GetBuilder<AuthController>(
          builder: (authController) {
            return authController.isLoading
                ? ProgressIndicatorWidget()
                : Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.all(30),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Dimension.height40 * 2,
                          ),

                          // FORM FIELD
                          Form(
                            child: Column(
                              children: [
                                // EMAIL
                                AuthTextField(
                                  action: TextInputAction.done,
                                  obs: false,
                                  inputkey: TextInputType.emailAddress,
                                  label: 'Email Address',
                                  textControl: emailController,
                                  submit: () {
                                    forgotPassword(authController, context);
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
                                      'Send Link',
                                      style: TextStyle(
                                          color: AppColors.primaryColor),
                                    ),
                                    onPressed: () {
                                      forgotPassword(authController, context);
                                    },
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
