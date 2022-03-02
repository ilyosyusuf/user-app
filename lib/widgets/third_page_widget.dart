import 'package:flutter/material.dart';
import 'package:lesson25/models/album_model.dart';
import 'package:lesson25/models/photo_model.dart';
import 'package:lesson25/services/photo_service.dart';
import 'package:lesson25/widgets/decoration_widget.dart';
import 'package:lesson25/widgets/text_widget.dart';

class ThirdPageWidget extends StatelessWidget {
  int? albumModel;
  ThirdPageWidget({ Key? key, this.albumModel }) : super(key: key);
  int indeks = 0;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PhotoService.getPhoto(),
      builder:(context, AsyncSnapshot<List<PhotoModel>> snap){
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
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (ctx, i){
              // return albumModel == data[i].albumId ?
              return Container(
                child: Text(data[albumModel!*50-1].albumId.toString(), style: TextStyle(decoration: TextDecoration.none, color: Colors.black),),
                // child: TextWidget.textWidget(text: data[i].albumId.toString()+ "hello"),
                decoration: DecBox.boxDecoration(image: data[i].url,rSize: 0),
              );
            },
            
            itemCount: 50,
            
            );
        }
      },
    );
  }
}