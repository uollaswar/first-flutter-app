import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tomorrow_caballos/service/dio_caller.dart';

class SecondRouteNotifier extends ChangeNotifier {
  int? selectedIndex;
  File? _image;

  File? get image => _image;

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
