import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_laravel_auth/common/utils/circular_progress_indicator.dart';
import 'package:flutter_laravel_auth/common/utils/colors.dart';
import 'package:flutter_laravel_auth/features/auth/controller/auth_controller.dart';
import 'package:flutter_laravel_auth/features/auth/screens/auth_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Image.asset(
              "assets/images/if not God.png 1.png",
              fit: BoxFit.cover,
            ),
            const Text(
              'Experience Tech At Its Best',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            const Text(
              'Making software developments as easy as posible. Not just about writing codes, but writing maintainable and reusable codes make software development more fun',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 100,
            ),
            GetBuilder<AuthController>(builder: ((controller) {
              return GestureDetector(
                onTap: () => Get.toNamed(AuthScreen.routeName),
                child: Container(
                  height: 50,
                  width: 150,
                  // color: Colors.black,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange[400],
                  ),
                  child: Center(
                    child: !controller.isLoading
                        ? Text(
                            'Subscribe',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        : ProgressIndicatorWidget(),
                  ),
                ),
              );
            }))
          ])),
    );
  }
}
