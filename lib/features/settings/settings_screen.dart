import 'package:flutter/material.dart';
import 'package:flutter_laravel_auth/features/auth/screens/auth_screen.dart';
import 'package:flutter_laravel_auth/features/settings/change_password.dart';
import 'package:flutter_laravel_auth/features/settings/update_email.dart';
import 'package:flutter_laravel_auth/features/settings/widgets/settings_card.dart';

//import 'package:itestify/src/core/utils/colors.dart';
//import 'package:itestify/views/editting_user/editting_user_screen.dart';

import 'package:get/get.dart';

import '../../common/utils/colors.dart';
import '../../common/utils/dimensions.dart';
//import 'package:itestify/views/widgets/small_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const routeName = '/settings-screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _oldvalue = false;
  bool changeIcon = false;
  void change(bool newValue) {
    {
      setState(() {
        _oldvalue = newValue;
      });
    }
  }

  void myswitch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        foregroundColor: AppColors.textColor,
        elevation: 0,
        title: Text(
          'SETTINGS',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(
                top: Dimension.height20 * 2,
                right: Dimension.width20,
                left: Dimension.width20,
                bottom: Dimension.height20),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(ChangePassword.routeName),
                    child: Settingscard(
                      function: () => Get.toNamed(ChangePassword.routeName),
                      icon: Icon(Icons.edit),
                      text: 'Change password',
                      text2: 'John Doe',
                    ),
                  ),
                  Settingscard(
                    function: () => Get.toNamed(UpdateEmail.routeName),
                    icon: Icon(Icons.edit),
                    text: 'Update Email',
                    text2: 'John Doe',
                  ),
                  Settingscard(
                    function: () => null,
                    icon: Icon(Icons.edit),
                    text: 'Update Username',
                    text2: 'John Doe',
                  ),
                  Settingscard(
                    function: () => Get.toNamed(AuthScreen.routeName),
                    icon: Icon(Icons.logout),
                    text: 'Logout',
                    text2: 'John Doe',
                  ),
                  Settingscard(
                    function: () {
                      setState(() {
                        changeIcon = !changeIcon;
                      });
                    },
                    icon: changeIcon == true
                        ? Icon(Icons.notifications_active_rounded)
                        : Icon(Icons.notifications_active_outlined),
                    text: 'Notification',
                    text2: 'All',
                  ),
                  // Container(
                  //   height: Dimension.height20 * 4,
                  //   margin: EdgeInsets.only(bottom: Dimension.height10),
                  //   child: Card(
                  //     elevation: 5,
                  //     child: Container(
                  //       padding: EdgeInsets.all(Dimension.height20),
                  //       child: Row(
                  //         children: [
                  //           Row(
                  //             children: [
                  //               IconButton(
                  //                 onPressed: () => () {
                  //                   setState(() {
                  //                     _oldvalue = !_oldvalue;
                  //                   });

                  //                   // Get.find<AppTheme>().toggleTheme();
                  //                 },
                  //                 icon: Icon(
                  //                   Icons.wb_sunny_rounded,
                  //                   color: AppColors.mainColor,
                  //                   size: Dimension.iconSize40 - 10,
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: Dimension.width15,
                  //               ),
                  //               Text(
                  //                 'Dark Mode',
                  //               ),
                  //             ],
                  //           ),
                  //           Spacer(),
                  //           // SwitchListTile(
                  //           //   value: _oldvalue,
                  //           //   onChanged: (bool newValue) {
                  //           //     set(() {
                  //           //       _oldvalue = newValue;
                  //           //     });
                  //           //   },
                  //           // ),
                  //           Switch(
                  //             value: _oldvalue,
                  //             //focusColor: Colors.red,
                  //             activeColor: AppColors.mainColor,
                  //             onChanged: (bool newValue) {
                  //               setState(() {
                  //                 _oldvalue = newValue;
                  //               });
                  //             },
                  //           ),
                  //           //Switch(value: true, onChanged: 1)
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Settingscard(
                  //   function: () {},
                  //   icon: Icon(Icons.help),
                  //   text: 'Help',
                  //   text2: 'Questions?',
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget darkmode(
//   BuildContext ctx,
//   bool _oldvalue,
//  void set(),
// ) {
//   return Container(
//     height: Dimension.height20 * 4,
//     margin: EdgeInsets.only(bottom: Dimension.height10),
//     child: Card(
//       elevation: 5,
//       child: Container(
//         padding: EdgeInsets.all(Dimension.height20),
//         child: Row(
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                   onPressed: () => Navigator.of(ctx).push(
//                       MaterialPageRoute(builder: (ctx) => EditUserScreen())),
//                   icon: Icon(
//                     Icons.wb_sunny_rounded,
//                     color: AppColors.mainColor,
//                     size: Dimension.iconSize40 - 10,
//                   ),
//                 ),
//                 SizedBox(
//                   width: Dimension.width15,
//                 ),
//                 Bigtext(
//                   text: 'Dark Mode',
//                   color: AppColors.mainColor,
//                 ),
//               ],
//             ),
//             Spacer(),
//             // SwitchListTile(
//             //   value: _oldvalue,
//             //   onChanged: (bool newValue) {
//             //     set(() {
//             //       _oldvalue = newValue;
//             //     });
//             //   },
//             // ),
//             Switch(
//               value: _oldvalue,
//               onChanged: (bool newvalue)=>set,
//             )
//             //Switch(value: true, onChanged: 1)
//           ],
//         ),
//       ),
//     ),
//   );
// }
