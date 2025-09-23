import 'package:flutter/material.dart';

Widget buildBall(Color color, {bool matched = false, bool shadow = false}) {
  return Container(
    width: 70,
    height: 70,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      boxShadow: shadow
          ? [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ]
          : null,
    ),
  );
}

