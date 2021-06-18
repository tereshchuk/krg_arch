import 'package:krg_app/screens/home_page_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class FindingWalletScreen extends StatefulWidget {
  FindingWalletScreen({Key? key}) : super(key: key);

  @override
  _FindingWalletScreenState createState() => _FindingWalletScreenState();
}

class _FindingWalletScreenState extends State<FindingWalletScreen>
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
      MaterialPageRoute(builder: (context) => MainScreen()),
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
            begin: Alignment.topLeft,
            end: Alignment.topCenter,
            colors: [
              // Colors.purple[600]!,
              // Colors.purple[700]!,
              Colors.purple[800]!.withOpacity(0.7),
              Colors.purple[900]!.withOpacity(0.7),
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
          'Ищем кошелек.......',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
