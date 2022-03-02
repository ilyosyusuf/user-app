import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/p_m_const.dart';
import 'package:lesson25/screens/first_page.dart';
import 'package:lesson25/widgets/apbar_widget_without.dart';
import 'package:lesson25/widgets/appbar_widget.dart';
import 'package:lesson25/widgets/second_page_widget.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({ Key? key }) : super(key: key);

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          flex: 1,
          child: AppBarWidgetWithout(text: "Albums",
          ),
        ),
        Expanded(
          flex: 9,
          child: Padding(
            padding: PMConst.kExtraSmallPM,
            child: SecondPageWidget(),
          ),
        )
      ]
    );
  }
}