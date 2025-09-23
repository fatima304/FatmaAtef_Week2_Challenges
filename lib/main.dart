import 'package:challenges/challenge3/screens/loading_dots.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChallengesApp());
}

class ChallengesApp extends StatelessWidget {
  const ChallengesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoadingDots());
  }
}
