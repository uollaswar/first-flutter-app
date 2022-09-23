import 'package:flutter/material.dart';

class ColorNotifier extends ChangeNotifier {
  List<bool> isCardEnabled = [];

  MaterialColor _color = Colors.blue;

  Color get colorValue => _color;

  cardEnabler(int index) {
    isCardEnabled.replaceRange(0, isCardEnabled.length,
        [for (int i = 0; i < isCardEnabled.length; i++) false]);
    isCardEnabled[index] = true;
    notifyListeners();
  }
}
