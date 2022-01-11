import 'package:flutter/material.dart';
import 'package:vithyou/screens/login.dart';
import 'package:vithyou/screens/splash/animation_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(children: <Widget>[
      Scaffold(body: Login()),
      IgnorePointer(child: AnimationScreen(color: Color(0xffE94560)))
    ]));
  }
}
