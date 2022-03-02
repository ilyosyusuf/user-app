import 'package:dio/dio.dart';
import 'package:lesson25/core/constants/url_const.dart';
import 'package:lesson25/models/user_model.dart';

class UserService{
  static Future<List<UserModel>> getUsers() async{
    Response res = await Dio().get(UrlConst.baseUrl + '/users');
    return (res.data as List).map((e) => UserModel.fromJson(e)).toList();
  }
}