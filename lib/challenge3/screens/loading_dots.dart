import 'package:challenges/challenge3/widgets/dots.dart';
import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _scaleAnims;
  late final List<Animation<double>> _opacityAnims;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    initAnimations();
  }

  void initAnimations() {
    _scaleAnims = List.generate(3, (i) {
      final start = i * 0.15;
      final end = start + 0.5;
      return TweenSequence([
        TweenSequenceItem(
          tween: Tween(
            begin: 0.6,
            end: 1.2,
          ).chain(CurveTween(curve: Curves.easeOut)),
          weight: 60,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 1.2,
            end: 0.9,
          ).chain(CurveTween(curve: Curves.easeIn)),
          weight: 40,
        ),
      ]).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end.clamp(0.0, 1.0)),
        ),
      );
    });

    _opacityAnims = List.generate(3, (i) {
      final start = i * 0.15;
      final end = start + 0.5;
      return Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end.clamp(0.0, 1.0), curve: Curves.easeIn),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> _buildDots() {
    return List.generate(
      3,
      (index) => Dots(
        scale: _scaleAnims[index],
        opacity: _opacityAnims[index],
        controller: _controller,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sequential Loading Dots')),
      body: Center(
        child: Row(mainAxisSize: MainAxisSize.min, children: _buildDots()),
      ),
    );
  }
}
