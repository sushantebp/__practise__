import 'package:flutter/material.dart';

class CurveShapeWidget extends CustomPainter {
  final Color color;
  final double progress; // Value from 0.0 to 1.0

  CurveShapeWidget({
    this.color = Colors.cyan,
    this.progress = 0.5, // 50% full by default
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // 1. Define the U-shape Path
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - (size.width / 2));
    path.arcToPoint(
      Offset(size.width, size.height - (size.width / 2)),
      radius: Radius.circular(size.width / 2),
      clockwise: false,
    );
    path.lineTo(size.width, 0);
    path.close();

    // 2. Clip the canvas so anything drawn next stays INSIDE the U
    canvas.clipPath(path);

    // 3. Calculate the "Liquid" height
    // We draw from the bottom up
    double fillHeight = size.height * progress;

    Rect fillRect = Rect.fromLTWH(
      0,
      size.height - fillHeight, // Start drawing from the calculated top
      size.width,
      fillHeight,
    );

    // 4. Draw the "Liquid"
    canvas.drawRect(fillRect, paint);

    // Optional: Draw a light border so you can see the "cup" when empty
    final outlinePaint = Paint()
      ..color = color.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawPath(path, outlinePaint);
  }

  @override
  bool shouldRepaint(covariant CurveShapeWidget oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
