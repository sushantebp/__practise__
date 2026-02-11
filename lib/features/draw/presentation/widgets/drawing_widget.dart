import 'package:flutter/material.dart';

class DrawingWidget extends CustomPainter {
  final List<Offset?> pointers;
  const DrawingWidget(this.pointers);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.black;

    for (int i = 0; i < pointers.length - 1; ++i) {
      if (pointers[i] != null && pointers[i + 1] != null) {
        canvas.drawLine(pointers[i]!, pointers[i + 1]!, paint);
      }
    }
  }
}
