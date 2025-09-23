import 'package:challenges/challenge1/challenge1_task.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengesApp());
}

class ChallengesApp extends StatelessWidget {
  const ChallengesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Challenge1(),
        appBar: AppBar(
          title: const Text('Task Manager'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }
}
