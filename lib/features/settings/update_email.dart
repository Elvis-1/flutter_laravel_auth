import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/common/utils/colors.dart';
import 'package:flutter_laravel_auth/features/auth/widgets/textfield.dart';

class UpdateEmail extends StatelessWidget {
  UpdateEmail({super.key});
  static const routeName = '/change-email-screen';
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  'Update Email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: AuthTextField(
                      submit: () {},
                      action: TextInputAction.done,
                      obs: false,
                      inputkey: TextInputType.text,
                      label: 'New Email',
                      textControl: passwordController),
                ),
                TextButton(
                    onPressed: null,
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
