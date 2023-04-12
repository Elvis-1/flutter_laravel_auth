import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/screens/auth_screen.dart';
import 'package:flutter_laravel_auth/features/auth/screens/forgot_password.dart';
import 'package:flutter_laravel_auth/features/auth/screens/reset_password_screen.dart';
import 'package:flutter_laravel_auth/features/landing/home.dart';
import 'package:flutter_laravel_auth/features/settings/change_password.dart';
import 'package:flutter_laravel_auth/features/settings/update_email.dart';
import 'package:get/get.dart';
import 'features/landing/screens/tab.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  bool checkUserLoggedIn = Get.find<AuthController>().isUserLoggedIn();
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          //TabScreen(),
          //ResetPasswordScreen(),
          checkUserLoggedIn ? const TabScreen() : const AuthScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        UpdateEmail.routeName: (ctx) => UpdateEmail(),
        ChangePassword.routeName: (ctx) => ChangePassword(),
        TabScreen.routeName: (ctx) => const TabScreen(),
        AuthScreen.routeName: (ctx) => const AuthScreen(),
        ResetPasswordScreen.routeName: (ctx) => ResetPasswordScreen(),
        ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen(),
      },
    );
  }
}
