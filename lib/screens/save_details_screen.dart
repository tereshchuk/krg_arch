import 'package:krg_app/screens/create_pin-code_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:krg_app/screens/create_pinCode_screen.dart';

class SaveDetailsScreen extends StatefulWidget {
  @override
  _SaveDetailsScreenState createState() => _SaveDetailsScreenState();
}

class _SaveDetailsScreenState extends State<SaveDetailsScreen> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
            child: Form(
              key: _globalkey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headerIcon(),
                    SizedBox(height: 15),
                    seed(),
                    SizedBox(height: 25),
                    // password(),
                    // Text("For Keystore encryption",
                    //     style: TextStyle(
                    //       color: Colors.purple[200],
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 13,
                    //     )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    seedInfo(),
                    SizedBox(height: 25),
                    goToWalletButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget password() {
    return Text(
      "PASSWORD",
      style: TextStyle(
        color: Colors.purple[200],
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget seed() {
    return Text(
      "SEED",
      style: TextStyle(
        color: Colors.purple[200],
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }

  Widget goToWalletButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatepinCodeScreen()),
        );
      },
      child: Container(
        width: 150,
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
                'Go to wallet',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
            )),
      ),
    );
  }

  Widget seedInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.rotate(
          angle: 180 * math.pi / 180,
          child: Icon(
            Icons.info_outline_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
        SizedBox(width: 10),
        Text(
          "HDPathString\nm/44'/60'/0'/0 is used for\naddress generation.",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 19,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter Your Password";
        } else if (value.length < 8) {
          return "Password must be atleast 8 characters long";
        } else {
          return null;
        }
      },
      controller: _passwordController,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () {
            _togglevisibility();
          },
          child: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.white70,
          ),
        ),
        labelText: 'Password',
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 19,
      ),
      validator: (value) {
        Pattern pattern =
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$";
        RegExp regex = new RegExp(pattern as String);
        if (!regex.hasMatch(value!) || value == null)
          return 'Enter a valid email address';
        if (value.isEmpty) return "Email can't be empty";
        if (!value.contains("@")) return "Invalid Email";
        return null;
      },
      controller: _emailController,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
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
            fontSize: 18,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
