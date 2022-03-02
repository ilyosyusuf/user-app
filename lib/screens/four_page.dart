import 'package:flutter/material.dart';
import 'package:lesson25/models/to_do_model.dart';
import 'package:lesson25/services/to_do_service.dart';
import 'package:lesson25/widgets/apbar_widget_without.dart';
import 'package:lesson25/widgets/appbar_widget.dart';
import 'package:lesson25/widgets/text_widget.dart';

class ToDoPAge extends StatefulWidget {
  const ToDoPAge({Key? key}) : super(key: key);

  @override
  _ToDoPAgeState createState() => _ToDoPAgeState();
}

class _ToDoPAgeState extends State<ToDoPAge> {
  bool _checkboxListTile = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          flex: 1,
          child: AppBarWidgetWithout(
            text: "To Dos",
          ),
        ),
        Expanded(
            flex: 9,
            // child: ListView.builder(
            //   itemBuilder: (ctx, i) {
            //     return CheckboxListTile(
            //       title: const Text("Shartlarga rozimisiz?"),
            //       subtitle: const Text("Shartlar"),
            //       value: _checkboxListTile,
            //       onChanged: (status) {
            //         setState(() {
            //           _checkboxListTile = !_checkboxListTile;
            //         });
            //       },
            //     );
            //   },
            //   itemCount: 30,
            // )
              child: FutureBuilder(
                future: ToDoService.getToDos(),
                builder: (context,AsyncSnapshot<List<ToDoModel>> snap){
                  if(!snap.hasData){
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }else if(snap.hasError){
                    return Center(
                      child: TextWidget.textWidget(text: "Something went wrong :( Check your internet Connection"),
                    );
                  }else{
                    var data = snap.data!;
                    return ListView.builder(
                      itemBuilder: (ctx, i) {
                        return Card(
                          child: CheckboxListTile(
                            title: TextWidget.textWidget(text: data[i].title.toString() ),
                            subtitle: TextWidget.textWidget(text: "To Do ID: ${data[i].id}"),
                            value: data[i].completed,
                            onChanged: (status) {
                              setState(() {
                                if(data[i].completed == false){
                                  data[i].completed = true;
                                } else if(data[i].completed == true){
                                  data[i].completed = false;
                                }
                                // _checkboxListTile = !_checkboxListTile;

                              });
                            },
                          ),
                        );
                      },
                      itemCount: data.length
                    );
                  }
                }
              ),
            )
      ]),
    );
  }
}
