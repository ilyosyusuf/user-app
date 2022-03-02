import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/color_const.dart';
import 'package:lesson25/models/album_model.dart';
import 'package:lesson25/models/photo_model.dart';
import 'package:lesson25/services/photo_service.dart';
import 'package:lesson25/widgets/appbar_widget.dart';
import 'package:lesson25/widgets/decoration_widget.dart';
import 'package:lesson25/widgets/third_page_widget.dart';

class PhotoPage extends StatefulWidget {
  // AlbumModel album;
  // AlbumModel? albumModel;
  int? albumModel;
  PhotoPage({Key? key, this.albumModel}) : super(key: key);

  @override
  _PhotoPageState createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppBarWidget(
                text: "Photos",
                // dec: TextDecoration.none,
              ),
            ),
            Expanded(
                flex: 9,
                child: FutureBuilder(
                  future: PhotoService.getPhoto(),
                  builder: (context, AsyncSnapshot<List<PhotoModel>> snap) {
                    if (!snap.hasData) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (snap.hasError) {
                      return const Center(
                        child: Text(
                            "Something went wrong :( Check your internet connection"),
                      );
                    } else {
                      var data = snap.data!;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (ctx, i) {
                          // return albumModel == data[i].albumId ?
                          return Container(
                            child: Text(
                              data[widget.albumModel! * 50 - 1].albumId.toString(),
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black, fontSize: 20),
                            ),
                            // child: TextWidget.textWidget(text: data[i].albumId.toString()+ "hello"),
                            decoration:
                                DecBox.boxDecoration(image: data[widget.albumModel! + i].url, rSize: 0),
                          );
                        },
                        itemCount: 50,
                      );
                    }
                  },
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConst.kBlack,
        child: Icon(Icons.chevron_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    
  }
}
