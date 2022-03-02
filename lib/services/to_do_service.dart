import 'package:dio/dio.dart';
import 'package:lesson25/core/constants/url_const.dart';
import 'package:lesson25/models/to_do_model.dart';

class ToDoService{
  static Future<List<ToDoModel>> getToDos() async{
    Response res = await Dio().get(UrlConst.baseUrl + '/todos');
    return (res.data as List).map((e) => ToDoModel.fromJson(e)).toList();
  }
}