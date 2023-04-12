import 'package:flutter/material.dart';

import '../../../common/utils/colors.dart';

//import 'package:itestify/src/core/utils/colors.dart';

class Settingscard extends StatelessWidget {
  //IconData icon;
  String text;
  Widget icon;
  String text2;
  Function function;

  Settingscard(
      {Key? key,
      required this.icon,
      required this.text,
      required this.text2,
      required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 40),
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => function(),
                    icon: icon,
                    color: AppColors.mainColor,
                  ),
                  // Icon(
                  //   icon,
                  //   color: AppColors.mainColor,
                  //   size: 30,
                  // ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    text,
                  ),
                ],
              ),
              Spacer(),
              Text(
                text2,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
