import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  final Animation<double> scale;
  final Animation<double> opacity;
  final AnimationController controller;

  const Dots({
    super.key,
    required this.scale,
    required this.opacity,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Transform.scale(
          scale: scale.value,
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 134, 22, 129),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      },
    );
  }
}
