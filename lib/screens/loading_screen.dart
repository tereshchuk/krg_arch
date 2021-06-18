import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:krg_app/screens/login_screen.dart';
import 'package:krg_app/screens/welcome_screen.dart';

class LoadingScreen extends StatefulWidget {
  LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..repeat();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [.1, .4, .7, .9],
            colors: [
              Colors.blue[700]!,
              Colors.blue[800]!,
              Colors.blue[900]!,
              Colors.purple[700]!,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerIcon(),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget headerIcon() {
    return Column(
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, child) {
              return Transform.rotate(
                angle: _controller.value * 2 * math.pi,
                child: child,
              );
            },
            child: Container(
              height: 40,
              child: Image.asset(
                'images/image/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: 30,
          child: Divider(color: Colors.white, thickness: 2),
        ),
        SizedBox(height: 3),
        Text(
          'KRG',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
