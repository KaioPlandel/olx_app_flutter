
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_app/Home.dart';


final ThemeData temaPadrao = ThemeData(
  primaryColor: Color(0xff9c27b0),
  canvasColor: Color(0xff7b1fa2)
);

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen()
      },
    );
  }
}
