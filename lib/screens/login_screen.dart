import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:krg_app/screens/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // bool _showPassword = false;
  // void _togglevisibility() {
  //   setState(() {
  //     _showPassword = !_showPassword;
  //   });
  // }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  // TextEditingController _passwordController = TextEditingController();
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
                Colors.purple[300]!,
                Colors.purple[600]!,
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
                    emailTextField(),
                    SizedBox(height: 15),
                    // passwordTextField(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                    loginInfo(),
                    SizedBox(height: 25),
                    loginButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return GestureDetector(
      onTap: () {
        if (_globalkey.currentState!.validate()) {
          SnackBar snackbar = SnackBar(content: Text("Successfully Logged In"));
          // ignore: deprecated_member_use
          _scaffoldKey.currentState!.showSnackBar(snackbar);
          print(_emailController.text);
          // print(_passwordController.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
          );
        }
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
                'LOGIN',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            )),
      ),
    );
  }

  Widget loginInfo() {
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
          'If you do not have a wallet\nyet, then we will register\nyou using this data',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  // Widget passwordTextField() {
  //   return TextFormField(
  //     style: TextStyle(
  //       fontWeight: FontWeight.bold,
  //       color: Colors.white,
  //       fontSize: 19,
  //     ),
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return "Please Enter Your Password";
  //       } else if (value.length < 8) {
  //         return "Password must be atleast 8 characters long";
  //       } else {
  //         return null;
  //       }
  //     },
  //     controller: _passwordController,
  //     obscureText: !_showPassword,
  //     decoration: InputDecoration(
  //       suffixIcon: GestureDetector(
  //         onTap: () {
  //           _togglevisibility();
  //         },
  //         child: Icon(
  //           _showPassword ? Icons.visibility : Icons.visibility_off,
  //           color: Colors.white70,
  //         ),
  //       ),
  //       labelText: 'Password',
  //       labelStyle: TextStyle(
  //         fontFamily: 'Montserrat',
  //         fontWeight: FontWeight.bold,
  //         color: Colors.white70,
  //       ),
  //       focusedBorder: UnderlineInputBorder(
  //         borderSide: BorderSide(
  //           color: Colors.white,
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
