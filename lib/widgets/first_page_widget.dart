import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/color_const.dart';
import 'package:lesson25/core/constants/font_const.dart';
import 'package:lesson25/models/user_model.dart';
import 'package:lesson25/screens/five_page.dart';
import 'package:lesson25/services/user_service.dart';
import 'package:lesson25/widgets/text_widget.dart';

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({ Key? key }) : super(key: key);

  @override
  _FirstPageWidgetState createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  List<NetworkImage> _photos = List.generate(10, (index) => NetworkImage('https://source.unsplash.com/random/$index'));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.getUsers(),
      builder: (context, AsyncSnapshot<List<UserModel>> snap){
        if(!snap.hasData){
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else if(snap.hasError){
          return const Center(
            child: Text("Something went wrong :( Check your internet connection"),
          );
        }else{
          var data = snap.data!;
          return ListView.builder(
            itemBuilder: (ctx, i){
              return InkWell(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25.0,
                    backgroundColor: ColorConst.kPrimaryColor,
                    backgroundImage: _photos[i],
                  ),
                  title: TextWidget.textWidget(text: data[i].name.toString(), size: FontConst.kLargeFont),
                  subtitle: TextWidget.textWidget(text: data[i].email.toString(), color: ColorConst.kGrey),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> PostPage(user: data[i],)));
                },
              );
            },
            itemCount: data.length,
          
          );
        }
      }
    );
  }
}