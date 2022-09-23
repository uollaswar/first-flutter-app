import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_view.dart';
import '../provider/color_provider.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ColorNotifier(),
      child: Consumer<ColorNotifier>(
        builder: (context, myType, child) => Scaffold(
          appBar: AppBar(
            title: const Text('not gonna render'),
          ),
          body: Column(children: [
            GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: myType.isCardEnabled.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        myType.selectBox(index);
                      },
                      child: SizedBox(
                        height: 40,
                        width: 90,
                        child: Card(
                          color: myType.isCardEnabled[index]
                              ? Colors.black
                              : Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Ability Tag',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ),
                        ),
                      ));
                }),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.blue),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                    (Route<dynamic> route) => false);
              },
              child: const Text('logga fuck out!'),
            ),
          ]),
        ),
      ),
    );
  }
  //dfgdfg
}
