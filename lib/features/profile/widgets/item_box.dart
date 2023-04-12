import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemBox extends StatelessWidget {
  ItemBox(
      {Key? key, required this.name, required this.image, required this.phone})
      : super(key: key);
  String name;
  String image;
  String phone;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xFFe8e8e8), offset: Offset(0, 5)),
          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
          BoxShadow(
              color: Color(0xFFe8e8e8), blurRadius: 5.0, offset: Offset(5, 0)),
        ],
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          // item title
          Text(
            name,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          // rating
          Row(
            children: [
              Container(
                child: Icon(
                  Icons.star_rate_outlined,
                  color: Colors.yellowAccent,
                  size: 10,
                ),
              ),
              Container(
                child: Icon(
                  Icons.star_rate,
                  color: Colors.yellow,
                  size: 10,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          // price and cart icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                phone,
                style: TextStyle(fontSize: 13, color: Colors.lightBlue),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              Icon(Icons.favorite_outline),
            ],
          )
        ],
      ),
    );
  }
}
