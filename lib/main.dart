import 'package:flutter/material.dart';
import 'package:tomorrow_caballos/screens/login_view.dart';
import 'package:tomorrow_caballos/screens/profiles.dart';
import 'package:tomorrow_caballos/utilities/locator.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

//fc

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: LoginView());
  }
}
