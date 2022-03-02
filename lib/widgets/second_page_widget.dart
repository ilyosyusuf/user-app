import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/color_const.dart';
import 'package:lesson25/core/constants/p_m_const.dart';
import 'package:lesson25/models/album_model.dart';
import 'package:lesson25/screens/third_page.dart';
import 'package:lesson25/services/album_service.dart';
import 'package:lesson25/widgets/decoration_widget.dart';
import 'package:lesson25/widgets/text_widget.dart';
import 'package:lesson25/widgets/third_page_widget.dart';

class SecondPageWidget extends StatefulWidget {
  const SecondPageWidget({ Key? key }) : super(key: key);

  @override
  _SecondPageWidgetState createState() => _SecondPageWidgetState();
}

class _SecondPageWidgetState extends State<SecondPageWidget> {
  // List<NetworkImage> _photos = List.generate(100, (index) => NetworkImage('https://source.unsplash.com/random/$index'));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AlbumService.getAlbum(),
      builder: (context, AsyncSnapshot<List<AlbumModel>> snap){
        if(!snap.hasData){
          return const Center(
            child:  CircularProgressIndicator.adaptive(),
          );
        }else if(snap.hasError){
          return const Center(
            child: Text("Something went wrong :( Check your internet connection"),
          );
        } else{
          var data = snap.data!;
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10.0,
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisExtent: 200,
            ),
            itemBuilder: (ctx, i){
              return InkWell(
                child: Container(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: PMConst.kMediumPM,
                    child: TextWidget.textWidget(text: data[i].title.toString(), color: ColorConst.kWhite),
                    decoration: DecBox.boxDecoration(color: ColorConst.kBlack.withOpacity(0.6)),
                  ),
                  decoration: DecBox.boxDecoration(image: 'https://source.unsplash.com/random/$i', color: Colors.blueGrey),
                  // color: Colors.blueGrey,
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> PhotoPage(albumModel: snap.data![i].id)));
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