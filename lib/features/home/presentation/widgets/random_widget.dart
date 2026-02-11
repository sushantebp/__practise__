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
    // final paint1 = Paint()
    //   ..color = Colors.green
    //   ..strokeWidth = 5;

    final paint2 = Paint()
      ..color = Colors.red
      ..strokeWidth = 10;

    //
    // final paint3 = Paint()
    //   ..color = Colors.yellow
    //   ..strokeWidth = 5;
    //
    // canvas.drawCircle(const Offset(30, 40), 23, paint1);
    // canvas.drawCircle(const Offset(40, 50), 23, paint2);
    // canvas.drawCircle(const Offset(50, 60), 23, paint3);

    // const startPoint = Offset(10, 50);
    // const endPoint = Offset(50, 100);

    // TODO:: draw rectangle
    var path = Path();
    path.moveTo(50, 0);
    path.lineTo(150, 0);
    path.lineTo(150, 50);
    path.lineTo(50, 50);
    path.close();

    // canvas.drawLine(startPoint, endPoint, paint1);

    canvas.drawPath(path, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
