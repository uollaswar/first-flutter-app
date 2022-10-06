// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomorrow_caballos/provider/second_route_notifier.dart';
import 'package:tomorrow_caballos/screens/register_view.dart';
import 'package:tomorrow_caballos/utilities/locator.dart';
import 'package:tomorrow_caballos/widgets/logos_widget.dart';

import 'second_route.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String email = '';
  String password = '';
  late final SharedPreferences prefs;

  @override
  void initState() {
    initSharedPrefs();
    super.initState();
  }

  Future<void> initSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<SecondRouteNotifier>(),
      child: Consumer<SecondRouteNotifier>(
        builder: (context, myType, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset('assets/image.png'),
                  SizedBox(height: 15),
                  buildAlignText(),
                  buildEmailTextField(),
                  buildPasswordTextField(),
                  SizedBox(height: 18),
                  buildLoginButton(context, myType),
                  SizedBox(height: 25),
                  Text(
                    'Or login with...',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 15),
                  buildFANGlogin(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'New to iPlaceSquaresInBoxes?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterView()),
                          );
                        },
                        child: const Text('Register here'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row buildFANGlogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        LogosWidget(
          link: 'assets/googleLogo.png',
        ),
        SizedBox(width: 10),
        LogosWidget(
          link: 'assets/FacebookLogo.png',
        ),
        SizedBox(width: 10),
        LogosWidget(
          link: 'assets/appleLogo.png',
        ),
      ],
    );
  }

  Widget buildLoginButton(BuildContext context, SecondRouteNotifier myType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () async {
              if (emailController.text.isNotEmpty) {
                prefs.setString('email', emailController.text);
                prefs.setString('password', passwordController.text);
                setState(() {
                  email = emailController.text;
                  password = passwordController.text;
                });
                myType.setEmail(email);
                myType.setPassword(password);

                emailFocusNode.unfocus();
                passwordFocusNode.unfocus();
                await myType.login();
                /* Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                  (Route<dynamic> route) => false,
                ); */
              } else {
                showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(title: Text('wrong password jackass')));
              }
            },
            child: Text("Login")),
        Text(email),
        Text(password)
      ],
    );
  }

  //

  TextField buildPasswordTextField() {
    return TextField(
      controller: passwordController,
      focusNode: passwordFocusNode,
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
      focusNode: emailFocusNode,
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
