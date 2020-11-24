import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'homescreen.dart';
import 'splashscreen.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter SplashScreen',
      home: new SplashPage(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new Home()
      },
    );
  }
}




