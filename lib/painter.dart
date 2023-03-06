import 'package:flutter/material.dart';

const pink = Color.fromARGB(255, 226, 127, 129);
const purple = Color.fromARGB(255, 129, 127, 226);
const pinkGrey = Color.fromARGB(255, 209, 203, 226);

class BankUIPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    const Gradient gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0267, 1.0026],
      colors: [Color(0xFF432148), Color(0xFF213048)],
      transform: GradientRotation(150.11 * 3.141592 / 180),
    );
    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    // final center = Offset(size.width / 2, size.height / 2);
    // final radius = size.width / 3;
    //
    // const circleGradient = SweepGradient(
    //   colors: [pink, pinkGrey, purple, pink, purple, pink],
    //   tileMode: TileMode.mirror,
    // );
    //
    // final circlePaint = Paint()..shader = circleGradient.createShader(rect);
    // // canvas.drawCircle(center, radius, circlePaint);
    // final radialGradient = RadialGradient(
    //   colors: [pinkGrey, Colors.transparent,Colors.transparent],
    //   stops: [0, 0, 0.6],
    // );
    // final radialPaint = Paint()..shader = radialGradient.createShader(rect);
    // // canvas.drawCircle(center, radius, radialPaint);
  }

  @override
  bool shouldRepaint(BankUIPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BankUIPainter oldDelegate) => false;
}
