import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double h = size.height;
    double w = size.width;
    Paint paint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.fill;
    Path path = Path();
    path
      ..moveTo(0.0, h * 0.2)
      ..quadraticBezierTo(w * .42, h * 0.0, w * .32, h * .4)
      ..quadraticBezierTo(w * .24, h * .80, w * .5, h * .8)
      ..quadraticBezierTo(w * .76, h * .80, w * .68, h * .4)
      ..quadraticBezierTo(w * .58, h * .0, w, h * .2)
      ..lineTo(w, h)
      ..lineTo(0.0, h);

    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Colors.grey[400]!, 1.0, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
