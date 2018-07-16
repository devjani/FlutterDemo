import 'package:flutter/material.dart';
import 'package:flutter_app_splashscreen/HomeScreen.dart';
import 'package:flutter_app_splashscreen/LoginScreen.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
      '/Login': (BuildContext context) => new LoginScreen(),
    },
    theme: new ThemeData(
      primaryColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.deepOrangeAccent,
      hintColor: Colors.deepOrangeAccent
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  var _iconAnimation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();

//    _iconAnimationController = new AnimationController(
//        vsync: this, duration: new Duration(milliseconds: 8000));
//
//    _iconAnimation = new CurvedAnimation(
//        parent: _iconAnimationController, curve: Curves.easeIn);
//    _iconAnimation.addListener(() => this.setState(() {}));
//
//    _iconAnimationController.forward();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
          child: new Image(
        image: new AssetImage('images/splash.png')
      )),
    );
  }
}
