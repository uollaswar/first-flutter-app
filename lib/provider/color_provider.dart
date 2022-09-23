import 'package:flutter/material.dart';

class ColorNotifier extends ChangeNotifier {
  List<bool> isCardEnabled = List.generate(4, (index) => false);

  MaterialColor _color = Colors.blue;

  Color get colorValue => _color;

  selectBox(int index) {
    isCardEnabled.replaceRange(0, isCardEnabled.length,
        [for (int i = 0; i < isCardEnabled.length; i++) false]);
    isCardEnabled[index] = true;
    notifyListeners();
  }
}
