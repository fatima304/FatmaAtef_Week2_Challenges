import 'package:challenges/challenge1/ui/screen/challenge1_task.dart';
import 'package:challenges/challenge2/challenge2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengesApp());
}

class ChallengesApp extends StatelessWidget {
  const ChallengesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Challenge1(),
      );
  }
}
