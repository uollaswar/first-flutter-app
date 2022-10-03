import 'package:flutter/material.dart';
import 'package:tomorrow_caballos/service/dio_caller.dart';

import '../model/user_response_model.dart';

class DioCallerProvider extends ChangeNotifier {
  DioCaller dioCaller = DioCaller();
  UserResponseModel? users = UserResponseModel();
  int index = 0;

  getHttpData() async {
    users = await dioCaller.getHttp();
    notifyListeners();
  }

  init() {
    getHttpData();
  }

  setIndex(int value) {
    index = value;
  }
}
