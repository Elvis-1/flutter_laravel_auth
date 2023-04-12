import 'package:flutter/material.dart';

class TrendingBox extends StatelessWidget {
  const TrendingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      // width: double.maxFinite,
      child: Row(
        children: [
          // image

          // trending
          Column(
            children: [
              Text('Trendy'),
              Text('Nike Sport Shoe'),
            ],
          ),

          // price
          Column(
            children: [
              // Expanded(child: Container()),
              Text('NGN14,500'),
            ],
          )
        ],
      ),
    );
  }
}
