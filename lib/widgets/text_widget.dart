
import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/font_const.dart';

class TextWidget{
  static textWidget({required String text, Color color = Colors.black, double size = FontConst.kMediumFont, TextDecoration? dec, FontWeight? weight}){
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, decoration:  dec, fontWeight: weight),
    );
  }
}