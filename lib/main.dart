import 'package:flutter/material.dart';
import 'package:tomorrow_caballos/login_view.dart';

void main() => runApp(const MyApp());

//fc

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: LoginView());
  }
}
