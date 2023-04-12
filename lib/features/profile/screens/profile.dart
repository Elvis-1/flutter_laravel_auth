import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';
import '../widgets/item_box.dart';
import '../widgets/trending_box.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [
            // header
            Header(),
            // main item box
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/1.jpeg',
                          phone: '0802343222'),
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/2.jpeg',
                          phone: '0802343222'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/3.jpeg',
                          phone: '0802343222'),
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/2.jpeg',
                          phone: '0802343222'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/4.jpeg',
                          phone: '0802343222'),
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/2.jpeg',
                          phone: '0802343222'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/4.jpeg',
                          phone: '0802343222'),
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/5.jpeg',
                          phone: '0802343222'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/6.jpeg',
                          phone: '0802343222'),
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/7.jpeg',
                          phone: '0802343222'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/8.jpeg',
                          phone: '0802343222'),
                      ItemBox(
                          name: 'New name',
                          image: 'assets/images/9.jpeg',
                          phone: '0802343222'),
                    ],
                  ),
                ],
              ),
            ),

            // trending
            // TrendingBox(),
          ],
        ),
      ),
    );
  }
}
