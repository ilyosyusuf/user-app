import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/color_const.dart';
import 'package:lesson25/screens/first_page.dart';
import 'package:lesson25/screens/four_page.dart';
import 'package:lesson25/screens/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin{
  TabController? _tabController;
  Color color = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: myTabBar,
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            FirstPage(),
            AlbumPage(),
            ToDoPAge(),
          ]
        
        ),
      ),
    );
  }

  TabBar get myTabBar => TabBar(
    indicatorColor: ColorConst.kPrimaryColor,
    unselectedLabelColor: Colors.black,
    labelColor: ColorConst.kPrimaryColor,
    controller: _tabController,
    tabs:[
      Tab(icon: Icon(Icons.people_outline), text: "users",),
      Tab(icon: Icon(Icons.collections_outlined), text: "albums",),
      Tab(icon: Icon(Icons.edit),text: "todos"),
      // Tab(icon: Icon(Icons.local_post_office_outlined), text: "posts",),
      // Tab(icon: Icon(Icons.photo_outlined), text: "photos",),
      // Tab(icon: Icon(Icons.chat_bubble_outline),text: "comments"),
    ] 
  );
}