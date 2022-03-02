import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/color_const.dart';
import 'package:lesson25/core/constants/font_const.dart';
import 'package:lesson25/core/constants/p_m_const.dart';
import 'package:lesson25/models/post_model.dart';
import 'package:lesson25/models/user_model.dart';
import 'package:lesson25/screens/six_page.dart';
import 'package:lesson25/services/post_service.dart';
import 'package:lesson25/widgets/appbar_widget.dart';
import 'package:lesson25/widgets/text_widget.dart';
import 'package:readmore/readmore.dart';

class PostPage extends StatefulWidget {
  UserModel user;
  PostPage({ Key? key, required this.user }) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppBarWidget(text: "Posts",
              ),
            ),
            Expanded(
              flex: 9,
              child: FutureBuilder(
                future: PostService.getPost(),
                builder: (context,AsyncSnapshot<List<PostModel>> snap){
                  if(!snap.hasData){
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if(snap.hasError){
                    return   Center(
                      child: TextWidget.textWidget(text: "Somethinng went wrong :( Check your internet connection"),
                    );
                  }else{
                    var data = snap.data!;
                    return ListView.builder(
                      itemBuilder: (ctx, i){
                        return Container(
                          color: ColorConst.kWhite,
                          height: 460,
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children:[
                              ListTile(
                                leading: CircleAvatar(backgroundImage: NetworkImage('https://source.unsplash.com/random/${widget.user.id!-1}'),),
                                title: TextWidget.textWidget(text: widget.user.name.toString()),
                                trailing: Icon(Icons.more_vert),
                              ),
                              Container(
                                height: 200,
                                width: double.infinity,
                                child: Image.network('https://source.unsplash.com/random/${widget.user.id!*10 + i - 11}', fit: BoxFit.cover,),
                              ),
                              ListTile(
                                leading: Container(
                                  width: 80,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.favorite_outline),
                                      Icon(Icons.comment),
                                      Icon(Icons.send),
                                    ],
                                  )   
                                ),
                                trailing: Icon(Icons.bookmark_outline),
                              ),
                              Container(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    TextWidget.textWidget(text: widget.user.name.toString()),
                                    // TextWidget.textWidget(text: data[widget.user.id!].id.toString()),
                                    
                                    TextWidget.textWidget(text: data[widget.user.id!*10 + i - 10].id.toString())
                                  ],
                                )
                              ),
                              Expanded(
                                child: 
                                ReadMoreText(data[widget.user.id!*10+i-10].body.toString(),
                                  trimCollapsedText: "Show more...",
                                  trimExpandedText: "Show less",
                                  trimMode: TrimMode.Length,
                                  trimLength: 80,
                                  colorClickableText: ColorConst.kGrey,
                                  style: TextStyle(color: ColorConst.kBlack),
                                )
                                    // TextWidget.textWidget(text: data[widget.user.id!*10+i-10].body.toString()),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                width: double.infinity,
                                child: InkWell(
                                    child: TextWidget.textWidget(text: "See all comments...", color: ColorConst.kGrey, size: FontConst.kSmallFont),
                                    onTap: () {
                                      int? post_id = data[widget.user.id!*10 + i - 10].id;
                                      Navigator.push(context, MaterialPageRoute(builder: (ctx)=> CommentPage(posts: post_id!)));
                                    },
                                ),
                              )
                            ]
                          )
                        );
                      },
                      itemCount: 10,
                    );
                  }
                },
              )
            )
          ],
        ),
      ),
    );
  }
}