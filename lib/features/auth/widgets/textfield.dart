import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/common/utils/colors.dart';

import '../../../common/utils/dimensions.dart';

class AuthTextField extends StatelessWidget {
  AuthTextField(
      {Key? key,
      required this.submit,
      required this.action,
      required this.obs,
      required this.inputkey,
      required this.label,
      required this.textControl})
      : super(key: key);
  String label;
  TextEditingController textControl;
  TextInputType inputkey;
  bool obs;
  TextInputAction action;
  Function submit;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimension.height10),
      padding: EdgeInsets.only(top: Dimension.height10 / 2),
      decoration: BoxDecoration(
          border: Border.all(
        color: AppColors.mainColor,
        width: Dimension.width10 - 9,
      )),
      child: TextFormField(
        controller: textControl,
        obscureText: obs,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: Dimension.width10 / 2),
            border: InputBorder.none,
            labelText: label),
        keyboardType: inputkey,
        textInputAction: action,
        onFieldSubmitted: (_) {
          submit();
        },
      ),
    );
  }
}
