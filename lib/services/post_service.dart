
import 'package:dio/dio.dart';
import 'package:lesson25/core/constants/url_const.dart';
import 'package:lesson25/models/post_model.dart';

class PostService{
  static Future<List<PostModel>> getPost() async{
    Response res = await Dio().get(UrlConst.baseUrl + '/posts');
    return (res.data as List).map((e) =>PostModel.fromJson(e)).toList();
  }
}