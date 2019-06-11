import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Sushi{
  final String name;

  final String category;

  final int price;
  final Color colour;

  final int kcal;

  final String path;

  final int rolls;
  Sushi({@required this.name, @required this.path, @required this.rolls, @required this.kcal, @required this.category, @required this.colour, @required this.price});
}