// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tomorrow_caballos/widgets/logos_widget.dart';

import 'screens/second_route.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset('assets/image.png'),
            SizedBox(height: 15),
            buildAlignText(),
            buildEmailTextField(),
            buildPasswordTextField(),
            bueldLoginButton(context),
            SizedBox(height: 25),
            Text(
              'Or login with...',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                LogosWidget(
                  link: 'assets/GoogleLogo.png',
                ),
                SizedBox(width: 15),
                LogosWidget(
                  link: 'assets/FacebookLogo.png',
                ),
                SizedBox(width: 15),
                LogosWidget(
                  link: 'assets/AppleLogo.png',
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'New to iPlaceSquaresInBoxes? L I N K',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Container bueldLoginButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
          onPressed: () {
            if (emailController.text.isNotEmpty) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                  (Route<dynamic> route) => false);
            } else {
              showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(title: Text('wrong password jackass')));
            }
          },
          child: Text("Login")),
    );
  }

  //

  TextField buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: "password",
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('Forgot?',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  TextField buildEmailTextField() {
    return TextField(
      controller: emailController,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.email_sharp), labelText: "email"),
    );
  }

  Widget buildAlignText() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
