import 'package:dio/dio.dart';

import '../model/user_response_model.dart';

class DioCaller {
  Dio dio = Dio();
  Future<UserResponseModel?> getHttp() async {
    dio
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    try {
      var response = await dio.get('https://reqres.in/api/users?page=2');
      UserResponseModel? result = UserResponseModel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
