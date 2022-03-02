import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/p_m_const.dart';
import 'package:lesson25/widgets/first_page_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({ Key? key }) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: PMConst.kMediumPM,
            child: CupertinoSearchTextField()
          )
        ),
        Expanded(
          flex: 9,
          child: FirstPageWidget(),
        
        )
      ],
    );
  }
}