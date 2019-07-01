import 'package:flutter/material.dart';
import 'package:sushi/basket_sliding_panel.dart';
import 'package:sushi/circular_container.dart';
import 'package:sushi/sushi_list_page.dart';
import 'carousel_slider.dart';
import 'package:sushi/sushi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: SushiListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
