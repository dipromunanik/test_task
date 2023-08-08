import 'package:flutter/material.dart';

class Common{

  static var scaffoldKey = GlobalKey<ScaffoldState>();

  static fieldTitle18(String s) {
    return Text(
      s,
      style:const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff36415F),
      ),
    );
  }

  static tradeTitle(String s) {
    return Text(
      s,
      style:const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xff36415F),
      ),
    );
  }

  static profileText(String s) {
    return Text(
      s,
      style:const TextStyle(
        fontSize: 16,
        height: 2,
        fontWeight: FontWeight.w500,
        color: Colors.white,
      ),
    );
  }


}