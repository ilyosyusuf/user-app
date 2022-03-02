import 'package:dio/dio.dart';
import 'package:lesson25/core/constants/url_const.dart';
import 'package:lesson25/models/photo_model.dart';

class PhotoService{
  static Future<List<PhotoModel>> getPhoto() async{
    Response res = await Dio().get(UrlConst.baseUrl + '/photos');
    return (res.data as List).map((e) => PhotoModel.fromJson(e)).toList();
  }
}