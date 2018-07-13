import 'package:flutter/material.dart';
import 'package:flutter_app_splashscreen/HomeScreen.dart';
import 'package:flutter_app_splashscreen/login_fragment.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
      '/Login': (BuildContext context) => new LoginScreen(),
    },
    theme: new ThemeData(
      primaryColor: Colors.blue,
      backgroundColor: Colors.blue
    ),
  ));
}
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Flutter Demo',
//      theme: new ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//        // counter didn't reset back to zero; the application is not restarted.
//        primarySwatch: Colors.blue,
//      ),
//      home: new MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}

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
