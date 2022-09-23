import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_caballos/screens/providers/second_route_provider.dart';

import '../login_view.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ColorNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      context.watch<ColorNotifier>().isCardEnabled.add(false);
                      return GestureDetector(
                          onTap: () {on
                            context
                                .watch<ColorNotifier>()
                                .isCardEnabled
                                .replaceRange(
                                    0,
                                    context
                                        .watch<ColorNotifier>()
                                        .isCardEnabled
                                        .length,
                                    [
                                  for (int i = 0;
                                      i <
                                          context
                                              .watch<ColorNotifier>()
                                              .isCardEnabled
                                              .length;
                                      i++)
                                    false
                                ]);
                            context
                                .watch<ColorNotifier>()
                                .isCardEnabled[index] = true;
                            //context.watch<ColorNotifier>().setState(() {});
                          },
                          child: SizedBox(
                            height: 40,
                            width: 90,
                            child: Card(
                              color: context
                                      .watch<ColorNotifier>()
                                      .isCardEnabled[index]
                                  ? Colors.cyan
                                  : Colors.grey.shade200,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Text(
                                  'Ability Tag',
                                  style: TextStyle(
                                      color: context
                                              .watch<ColorNotifier>()
                                              .isCardEnabled[index]
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ));
                    })
              ]),
        ),
      ),
    );
  }
  //dfgdfggffgdf
}
