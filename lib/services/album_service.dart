import 'package:dio/dio.dart';
import 'package:lesson25/core/constants/url_const.dart';
import 'package:lesson25/models/album_model.dart';

class AlbumService{
  static Future<List<AlbumModel>> getAlbum() async{
    Response res = await Dio().get(UrlConst.baseUrl + '/albums');
    return (res.data as List).map((e) => AlbumModel.fromJson(e)).toList();
  }
}