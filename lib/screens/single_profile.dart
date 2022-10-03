// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tomorrow_caballos/model/user_response_model.dart';
import 'package:tomorrow_caballos/provider/dio_caller_provider.dart';
import 'package:tomorrow_caballos/provider/second_route_notifier.dart';

import '../utilities/locator.dart';

class SingleProfile extends StatelessWidget {
  const SingleProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => locator<DioCallerProvider>(),
      child: Consumer<DioCallerProvider>(
        builder: (context, value, child) {
          return Scaffold(
            body: Column(
              children: [
                Image.network(
                  value.users?.data?[value.index].avatar ?? '',
                  width: 100,
                  height: 100,
                ),
                Text(value.users?.data?[value.index].firstName ?? ''),
                Text(value.users?.data?[value.index].lastName ?? ''),
                Text(
                  value.users?.data?[value.index].email ?? '',
                  style: TextStyle(fontSize: 11, color: Colors.blue),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
