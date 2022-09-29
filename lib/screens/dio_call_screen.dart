import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tomorrow_caballos/provider/dio_caller_provider.dart';

class DioCallerScreen extends StatelessWidget {
  const DioCallerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DioCallerProvider(),
      child: Consumer<DioCallerProvider>(
          builder: (context, value, child) => Scaffold(
                body: Center(
                  child: ElevatedButton(
                      onPressed: (() => value.getHttpData()),
                      child: Text('download')),
                ),
              )),
    );
  }
}
