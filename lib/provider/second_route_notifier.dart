import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tomorrow_caballos/service/dio_caller.dart';
import 'package:tomorrow_caballos/service/login_service.dart';

import '../model/login_response_model.dart';
import '../model/user_response_model.dart';
import '../service/register_service.dart';

class SecondRouteNotifier extends ChangeNotifier {
  int? selectedIndex;
  File? _image;
  File? get image => _image;

  String email = '';
  String password = '';
  String emailRegister = '';
  String passwordRegister = '';
  late final UserModel user;
  LoginService loginService = LoginService();
  RegisterService registerService = RegisterService();

  setEmail(String email) {
    this.email = email;
  }

  setPassword(String password) {
    this.password = password;
  }

  setEmailRegister(String emailRegister) {
    this.emailRegister = emailRegister;
  }

  setPasswordRegister(String passwordRegister) {
    this.passwordRegister = passwordRegister;
  }

  Future<void> login() async {
    await loginService.login(email, password);
  }

  Future<void> register() async {
    final LoginResponseModel? registerResponse = await registerService.register(emailRegister, passwordRegister);
    registerResponse.token
  }

  setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      //final imageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      _image = imagePermanent;
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
    notifyListeners();
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    print('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }
}
