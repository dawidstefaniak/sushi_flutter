import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
class MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    var firstCirclePaint = Paint()..color = Gradients.hersheys.colors.last;
    var firstCircleVerticalPosition = size.height*0.9;
    var firstCircleHorizontalPosition = size.width*1.7;
    double firstCircleSize = size.width;

    canvas.drawCircle(Offset(firstCircleHorizontalPosition,firstCircleVerticalPosition), firstCircleSize, firstCirclePaint);

  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(MyPainter oldDelegate) => false;
}