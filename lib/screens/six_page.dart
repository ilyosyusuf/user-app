import 'package:flutter/material.dart';
import 'package:lesson25/core/constants/font_const.dart';
import 'package:lesson25/core/constants/p_m_const.dart';
import 'package:lesson25/models/comment_model.dart';
import 'package:lesson25/models/post_model.dart';
import 'package:lesson25/models/user_model.dart';
import 'package:lesson25/services/comment_service.dart';
import 'package:lesson25/widgets/appbar_widget.dart';
import 'package:lesson25/widgets/text_widget.dart';

class CommentPage extends StatelessWidget {
  int posts;
  // UserModel users;
  CommentPage({ Key? key, required this.posts }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppBarWidget(text: "Comments",
              ),
            ),
            Expanded(
              flex: 9,
              child: FutureBuilder(
                future: CommentService.getComment(),
                builder: (context, AsyncSnapshot<List<CommentModel>> snap){
                  if(!snap.hasData){
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }else if(snap.hasError){
                    return Center(
                      child: TextWidget.textWidget(text: "Something went wrong :( Check your internet connection"),
                    );
                  }else{
                    var data = snap.data!;
                    return ListView.builder(
                      itemBuilder: (ctx, i){
                        return Container(
                          width: double.infinity,
                          padding: PMConst.kSmallPM,
                          child: ListTile(
                            leading: CircleAvatar(backgroundImage: NetworkImage('https://source.unsplash.com/random/${posts*5+i-6}'),),
                            title: TextWidget.textWidget(text: data[posts*5+i-5].email.toString(), size: 18, weight: FontWeight.bold),
                            subtitle: TextWidget.textWidget(text: data[posts*5+i-5].body.toString()),
                            trailing: Icon(Icons.favorite_border_outlined),
                          ),
                        );
                      },
                      itemCount: 5,
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