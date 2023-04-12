import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/common/utils/colors.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/screens/forgot_password.dart';
import 'package:flutter_laravel_auth/features/auth/widgets/textfield.dart';
import 'package:flutter_laravel_auth/features/landing/home.dart';
import 'package:flutter_laravel_auth/features/landing/screens/tab.dart';
import 'package:flutter_laravel_auth/models/response_model.dart';
import 'package:flutter_laravel_auth/models/signup_body.dart';
import 'package:get/get.dart';

import '../../../common/utils/circular_progress_indicator.dart';
import '../../../common/utils/dimensions.dart';

enum AuthMode { SignUp, Login }

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const routeName = '/auth-screen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthMode _authMode = AuthMode.Login;

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordConfirmController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

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

  signup(AuthController authController) {
    // Navigator.of(context).pushNamed(HomeScreen.routeName);
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirm = passwordConfirmController.text.trim();

    if (name.isEmpty) {
      _errorDialog('Name can not be empty');
      return;
    } else if (email.isEmpty) {
      _errorDialog('Email can not be empty');
      return;
    } else if (!email.isEmail) {
      _errorDialog('Email must be correctly formed');
      return;
    } else if (password.isEmpty) {
      _errorDialog('Password can not be empty');
      return;
    } else if (passwordConfirm.isEmpty) {
      _errorDialog('Password can not be empty');
      return;
    } else if (password.length < 8) {
      _errorDialog('Password can not be less than 6 characterss');
      return;
    } else {
      // SignupBody signupBody = SignupBody(
      //     email: email,
      //     password: password,
      //     userName: name,
      //     passwordConfirm: passwordConfirm);
      authController.signup(email, password).then((status) {
        if (status.isSuccess) {
          print('Signed up successful');
          name = '';
          email = '';
          password = '';
          Navigator.of(context).pushNamed(TabScreen.routeName);
        } else {
          print(status.message);
        }
      });
    }
  }

  login(AuthController authController) async {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    if (email.isEmpty) {
      _errorDialog('Email can not be empty');
      return;
    } else if (!email.isEmail) {
      _errorDialog('Email must be correctly formed');
      return;
    } else if (password.isEmpty) {
      _errorDialog('Password can not be empty');
      return;
    } else {
      ResponseModel responseModel = await authController.login(email, password);
      if (responseModel.isSuccess) {
        email = '';
        password = '';
        Get.toNamed(TabScreen.routeName);
        return;
      }
      _errorDialog(responseModel.message);
      print(responseModel.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            'ITESTIFY',
          ),
        ),
        body: GetBuilder<AuthController>(builder: (authController) {
          return authController.isLoading
              ? ProgressIndicatorWidget()
              : SingleChildScrollView(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // SIGNUP BUTTON
                              TextButton(
                                onPressed: _switchAuthMode,
                                child: _authMode == AuthMode.Login
                                    ? Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: AppColors.subtextColor,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(
                                            bottom: Dimension.height10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: AppColors.mainColor,
                                                    width: 1))),
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700),
                                        )),
                              ),

                              // LOGIN BUTTON
                              TextButton(
                                onPressed: _switchAuthMode,
                                child: _authMode == AuthMode.Login
                                    ? Container(
                                        padding: EdgeInsets.only(
                                            bottom: Dimension.height10),
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: AppColors.mainColor,
                                                    width: 1))),
                                        child: Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              color: AppColors.mainColor,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700),
                                        ))
                                    : Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: AppColors.subtextColor,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w700),
                                      ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Dimension.height20,
                        ),

                        // FORM FIELD
                        Form(
                          child: Column(
                            children: [
                              _authMode == AuthMode.SignUp
                                  ? Column(
                                      children: [
                                        AuthTextField(
                                          action: TextInputAction.next,
                                          obs: false,
                                          inputkey: TextInputType.text,
                                          label: 'Full Name',
                                          textControl: nameController,
                                          submit: () {},
                                        ),
                                        SizedBox(
                                          height: Dimension.height20,
                                        )
                                      ],
                                    )
                                  : SizedBox.shrink(),

                              // EMAIL
                              AuthTextField(
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
                              // PASSWORD
                              AuthTextField(
                                action: TextInputAction.next,
                                obs: true,
                                inputkey: TextInputType.emailAddress,
                                label: 'Password',
                                textControl: passwordController,
                                submit: () {
                                  // print('pressed');
                                },
                              ),
                              _authMode == AuthMode.SignUp
                                  ? AuthTextField(
                                      action: TextInputAction.next,
                                      obs: true,
                                      inputkey: TextInputType.emailAddress,
                                      label: 'Password Confirm',
                                      textControl: passwordConfirmController,
                                      submit: () {
                                        _authMode == AuthMode.SignUp
                                            ? signup(authController)
                                            : login(authController);
                                        // print('pressed');
                                      },
                                    )
                                  : SizedBox.shrink(),
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
                                    '${_authMode == AuthMode.Login ? 'LOGIN' : 'SIGNUP'}',
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                  onPressed: () => _authMode == AuthMode.SignUp
                                      ? signup(authController)
                                      : login(authController),
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
                              SizedBox(
                                height: 10,
                              ),
                              _authMode != AuthMode.SignUp
                                  ? Row(
                                      children: [
                                        Text(
                                          'Forgot your password?',
                                          style: TextStyle(),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Get.toNamed(ForgotPasswordScreen
                                                  .routeName);
                                            },
                                            child: Text(
                                              'Reset',
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ))
                                      ],
                                    )
                                  : SizedBox.shrink()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        }));
  }
}
