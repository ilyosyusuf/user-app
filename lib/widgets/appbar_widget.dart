import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/color_const.dart';
import 'package:lesson25/widgets/text_widget.dart';

class AppBarWidget extends StatelessWidget {
  String text;
  TextDecoration? dec;
  AppBarWidget({ Key? key, required this.text, this.dec }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorConst.kWhite,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: TextWidget.textWidget(text: text, size: 30, color: ColorConst.kPrimaryColor, dec: dec, )
        ),
        Positioned(
          top: 15,
          child: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        
        )
      ],
    );
  }
}