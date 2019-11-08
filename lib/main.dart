import 'package:flutter/material.dart';
import 'package:navbar_ui/first_nav.dart';
import 'package:navbar_ui/fourth_nav.dart';
import 'package:navbar_ui/second_nav.dart';
import 'package:navbar_ui/third_nav.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double get w => MediaQuery.of(context).size.width;
  double get h => MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: Column(
          children: <Widget>[
            Container(
              width: w,
              height: h / 4,
              color: Color(0xff40404F),
              child: Firstnav(w: w),
            ),
            Container(
              width: w,
              height: h / 4,
              color: Colors.white,
              child: FourthNav(w: w),
            ),
            Container(
              width: w,
              height: h / 4,
              color: Color(0xffe1e3e8),
              child: SecondNav(w: w),
            ),
            Container(
              width: w,
              height: h / 4,
              color: Colors.white,
              child: ThirdNav(w: w, h: h),
            ),
          ],
        ),
      ),
    );
  }
}
