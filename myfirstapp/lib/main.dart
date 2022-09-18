import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Challenge(),
    );
  }
}

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [Text(count.toString())],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                count++;
              });
              // Add your onPressed code here!
            },
            backgroundColor: Colors.green,
            child: const Icon(Icons.navigation)));
  }
}
