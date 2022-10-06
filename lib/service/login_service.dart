import 'package:dio/dio.dart';

import 'package:tomorrow_caballos/model/login_response_model.dart';

class LoginService {
  Future<LoginResponseModel?> login(String email, String password) async {
    final api = 'https://reqres.in/api/login';
    final data = {"email": email, "password": password};

    final dio = Dio();
    dio
      ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    Response response;

    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data;
      return LoginResponseModel(token: body['token']);
    } else {
      return null;
    }
  }
}
