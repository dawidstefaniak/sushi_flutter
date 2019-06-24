import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CircularContainer extends StatefulWidget {
  final Widget child;
  final Color color;
  final double size;

  CircularContainer({Key key, @required this.child, this.color = const Color(0xff202020), this.size = 45}) : super(key: key,);

  _CircularContainerState createState() => _CircularContainerState();
}

class _CircularContainerState extends State<CircularContainer> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
      width: widget.size,
      height: widget.size,
       child: widget.child,
    );
  }
}