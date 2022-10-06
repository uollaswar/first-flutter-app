// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tomorrow_caballos/provider/second_route_notifier.dart';
import 'package:tomorrow_caballos/screens/login_view.dart';
import 'package:tomorrow_caballos/utilities/locator.dart';
import 'package:tomorrow_caballos/widgets/logos_widget.dart';

import 'second_route.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailRegisterController = TextEditingController();
  TextEditingController passwordRegisterController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  String emailRegister = '';
  String passwordRegister = '';
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
                  buildRegisterButton(context, myType),
                  Text(
                    'Or register with with...',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w200),
                  ),
                  SizedBox(height: 15),
                  buildFANGlogin(),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        'Already have an account ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                      TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.blue),
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: const Text('Sign-in'),
                      )
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

  Widget buildRegisterButton(BuildContext context, SecondRouteNotifier myType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () async {
              if (emailRegisterController.text.isNotEmpty) {
                prefs.setString('email', emailRegisterController.text);
                prefs.setString('password', passwordRegisterController.text);
                setState(() {
                  emailRegister = emailRegisterController.text;
                  passwordRegister = passwordRegisterController.text;
                });
                myType.setEmailRegister(emailRegister);
                myType.setPasswordRegister(passwordRegister);

                emailFocusNode.unfocus();
                passwordFocusNode.unfocus();
                await myType.register();
                /* Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                  (Route<dynamic> route) => false,
                ); */
              } else {
                showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(title: Text('password required jackass')));
              }
              if (token !=null) {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterView()),
                          )};
            },
            child: Text("Register")),
        Text(emailRegister),
        Text(passwordRegister)
      ],
    );
  }

  //

  TextField buildPasswordTextField() {
    return TextField(
      controller: passwordRegisterController,
      focusNode: passwordFocusNode,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        labelText: "password",
        suffixIcon: Padding(
          padding: EdgeInsets.only(top: 15),
        ),
      ),
    );
  }

  TextField buildEmailTextField() {
    return TextField(
      controller: emailRegisterController,
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
          'Register',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
