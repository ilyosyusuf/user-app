import 'package:dio/dio.dart';
import 'package:lesson25/core/constants/url_const.dart';
import 'package:lesson25/models/comment_model.dart';

class CommentService{
  static Future<List<CommentModel>> getComment() async{
    Response res = await Dio().get(UrlConst.baseUrl + '/comments');
    return (res.data as List).map((e) => CommentModel.fromJson(e)).toList();
  }
}