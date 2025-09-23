import 'package:challenges/challenge2/widgets/ball_widget.dart';
import 'package:challenges/challenge2/widgets/color_dragger.dart';
import 'package:flutter/material.dart';

class DraggableTask extends StatefulWidget {
  const DraggableTask({super.key});

  @override
  State<DraggableTask> createState() => _DraggableTaskState();
}

class _DraggableTaskState extends State<DraggableTask> {
  final Map<Color, bool> matched = {
    const Color.fromARGB(255, 12, 105, 96): false,
    const Color.fromARGB(255, 88, 16, 85): false,
    const Color.fromARGB(255, 13, 64, 105): false,
  };

  void confirmColor(Color incoming, Color target) {
    setState(() {
      if (incoming == target) {
        matched[target] = true;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Correct Color')));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Wrong drop. Try again.')));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Balls')),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Draggables row
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: matched.keys.map((color) {
                final isMatched = matched[color]!;
                return Draggable<Color>(
                  data: color,
                  feedback: buildBall(color, shadow: true),
                  childWhenDragging: Opacity(
                    opacity: 0.3,
                    child: buildBall(color),
                  ),
                  child: buildBall(color, matched: isMatched),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: matched.keys.map((color) {
                return ColorDragger(
                  color: color,
                  isMatched: matched[color]!,
                  onAccept: (incoming) => confirmColor(incoming, color),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
