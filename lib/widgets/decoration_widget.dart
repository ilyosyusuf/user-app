import 'package:flutter/material.dart';

class DecBox{
  static boxDecoration({Color? color, double rSize = 15, String? image}){
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(rSize),
      image: DecorationImage(image: NetworkImage(image.toString()), fit: BoxFit.cover)
    );
  }
}