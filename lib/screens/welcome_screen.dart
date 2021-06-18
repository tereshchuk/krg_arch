import 'dart:math' as math;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:krg_app/context/setup/wallet_setup_provider.dart';
import 'package:krg_app/screens/create_pin-code_screen.dart';
import 'package:flutter/material.dart';
import 'package:krg_app/screens/create_wallet_screen.dart';
import 'package:krg_app/screens/save_details_screen.dart';

import '../wallet_create_page.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
          child: Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  headerIcon(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  accountInfo(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  createWallletButton(),
                  SizedBox(height: 30),
                  haveAWalletButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createWallletButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/create');
        /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateWalletScreen("1")),
        );*/
      },
      child: Container(
        width: 200,
        height: 54.0,
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
                style: BorderStyle.solid,
                width: 1.0,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                'Create Wallet',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            )),
      ),
    );
  }

  Widget haveAWalletButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SaveDetailsScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          width: 200,
          height: 54.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                'Have a Wallet?',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget accountInfo() {
    return Column(
      children: [
        Transform.rotate(
          angle: 180 * math.pi / 180,
          child: Icon(
            Icons.info_outline_rounded,
            size: 26,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'You can close the wallet and\nopen a new one at any time!',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget headerIcon() {
    return Column(
      children: [
        Container(
          height: 40,
          child: Image.asset(
            'images/image/logo.png',
            fit: BoxFit.cover,
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
