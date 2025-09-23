import 'package:challenges/challenge2/widgets/ball_widget.dart';
import 'package:flutter/material.dart';

class ColorDragger extends StatelessWidget {
  final Color color;
  final bool isMatched;
  final void Function(Color incoming) onAccept;

  const ColorDragger({
    super.key,
    required this.color,
    required this.isMatched,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return DragTarget<Color>(
      onWillAccept: (_) => true,
      onAccept: (incoming) => onAccept(incoming),
      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovering ? Colors.orange : Colors.black26,
              width: 2,
            ),
            color: isMatched ? color.withOpacity(0.4) : color,
          ),
          child:   isMatched ?
                Icon(Icons.check_circle, color: color, size: 50)
              :
                buildBall(color),
        );
      },
    );
  }
}
