import 'package:flutter/material.dart';
import 'package:fonibo_test/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
