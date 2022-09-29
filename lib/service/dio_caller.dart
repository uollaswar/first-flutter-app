import 'package:dio/dio.dart';

import '../model/user_response_model.dart';

class DioCaller {
  Future<UserResponseModel?> getHttp() async {
    try {
      var response = await Dio().get('https://reqres.in/api/users?page=2');
      UserResponseModel? result = UserResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
