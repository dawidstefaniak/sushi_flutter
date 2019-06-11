import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CircularContainer extends StatefulWidget {
  final Widget child;
  final Color color;

  CircularContainer({Key key, @required this.child, @required this.color}) : super(key: key);

  _CircularContainerState createState() => _CircularContainerState();
}

class _CircularContainerState extends State<CircularContainer> {


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color),
      width: 45,
      height: 45,
       child: widget.child,
    );
  }
}