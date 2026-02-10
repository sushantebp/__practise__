import 'package:flutter/material.dart';

class RandomWidget extends StatelessWidget {
  const RandomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _WavePainter());
  }
}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.green
      ..strokeWidth = 5;

    final paint2 = Paint()
      ..color = Colors.red
      ..strokeWidth = 5;

    final paint3 = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 5;

    // canvas.drawCircle(const Offset(30, 40), 23, paint1);
    // canvas.drawCircle(const Offset(40, 50), 23, paint2);
    // canvas.drawCircle(const Offset(50, 60), 23, paint3);

    canvas.drawLine(Offset(0, 0), Offset(size.width, 0), paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
