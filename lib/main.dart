import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_charts_example/graphs.dart';
import 'package:flutter_charts_example/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: kLightTheme,
      home: Graph(),
    );
  }
}
