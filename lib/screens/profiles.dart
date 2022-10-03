import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_caballos/provider/dio_caller_provider.dart';
import 'package:tomorrow_caballos/screens/single_Profile.dart';

import '../utilities/locator.dart';

class DioCallerScreen extends StatelessWidget {
  const DioCallerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<DioCallerProvider>(),
      child: Consumer<DioCallerProvider>(
          builder: (context, value, child) => Scaffold(
                backgroundColor: Colors.blue[100],
                body: Column(
                  children: [
                    Center(
                      heightFactor: 0.9,
                      child: ElevatedButton(
                          onPressed: (() => value.getHttpData()),
                          child: Text('download')),
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.1,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 25,
                                mainAxisExtent: 170),
                        itemCount: value.users?.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              value.setIndex(index);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleProfile()),
                              );
                            },
                            child: GridTile(
                                child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber[200],
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                    )
                                  ]),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Image.network(
                                    value.users?.data?[index].avatar ?? '',
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text(value.users?.data?[index].firstName ??
                                      ''),
                                  Text(
                                      value.users?.data?[index].lastName ?? ''),
                                  Text(
                                    value.users?.data?[index].email ?? '',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.blue),
                                  )
                                ],
                              ),
                            )),
                          );
                        })
                  ],
                ),
              )),
    );
  }
}
