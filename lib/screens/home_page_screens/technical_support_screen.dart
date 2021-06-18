import 'dart:math' as math;
import 'package:flutter/material.dart';

class TechnicalSupportScrren extends StatefulWidget {
  const TechnicalSupportScrren({Key? key}) : super(key: key);

  @override
  _TechnicalSupportScrrenState createState() => _TechnicalSupportScrrenState();
}

class _TechnicalSupportScrrenState extends State<TechnicalSupportScrren> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _messageHeaderController = TextEditingController();
  TextEditingController _messageBodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: WaveClipperTwo(),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .15,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.topRight,
          //         colors: [
          //           Colors.blue[900],
          //           Colors.purple[400],
          //         ],
          //       ),
          //       image: DecorationImage(
          //         alignment: Alignment.centerLeft,
          //         image: AssetImage(
          //           'images/image/fade.png',
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .1,
            child: Image.asset(
              'images/image/header.png',
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 70, left: 30, right: 30, bottom: 10),
              child: SingleChildScrollView(
                child: Form(
                  key: _globalkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _header(),
                      _headerText(),
                      _messageHeader(),
                      _messageBody(),
                      _sendButton(),
                      _sendInfo(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendInfo() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: 180 * math.pi / 180,
            child: Icon(
              Icons.info_outline_rounded,
              size: 26,
              color: Colors.purple[300],
            ),
          ),
          SizedBox(width: 5),
          Text(
            "A technical support operator will\nanswer you as soon as possible.",
            style: TextStyle(
              color: Colors.purple[300],
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sendButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 128.0),
      child: Align(
        child: GestureDetector(
          onTap: () {
            if (_globalkey.currentState!.validate()) {
              SnackBar snackbar = SnackBar(content: Text("Successfully Sent"));
              // ignore: deprecated_member_use
              _scaffoldKey.currentState!.showSnackBar(snackbar);
              setState(() {
                _messageHeaderController.text = "";
                _messageBodyController.text = "";
              });
              print(_messageHeaderController.text);
              print(_messageBodyController.text);
            }
          },
          child: Container(
            height: 40,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.purple[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Send Ticket",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageHeader() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
            color: Colors.purple[400]!, style: BorderStyle.solid, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          // keyboardType: TextInputType.multiline,
          // maxLines: null,
          // minLines: 3,
          // expands: true,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.purple[400],
            fontSize: 15,
          ),
          validator: (value) {
            if (value!.trim().isEmpty) {
              return "Can't be empty";
            } else
              return null;
          },
          controller: _messageHeaderController,
          decoration: InputDecoration(
            labelText: '  What ails you?',
            labelStyle: TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              color: Colors.purple[200],
            ),
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple[400]!,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _messageBody() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
            color: Colors.purple[400]!, style: BorderStyle.solid, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          // keyboardType: TextInputType.multiline,
          maxLines: null,
          // minLines: 3,
          // expands: true,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.purple[400],
            fontSize: 15,
          ),
          validator: (value) {
            if (value!.trim().isEmpty) {
              return "Can't be empty";
            } else
              return null;
          },
          controller: _messageBodyController,
          decoration: InputDecoration(
            labelText: '  Your message...',
            labelStyle: TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              color: Colors.purple[200],
            ),
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.purple[400]!,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _headerText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "TECHNICAL\nSUPPORT",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "We will help you deal with any difficulty.",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _header() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey[600]!,
                  style: BorderStyle.solid,
                  width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.grey[500],
              size: 25,
            ),
          ),
        ),
        SizedBox(width: 15),
        Text(
          "Home",
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
        Spacer(),
        _moreOptions(),
      ],
    );
  }

  _moreOptions() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => MenuScreen()),
        // );
      },
      child: Container(
        child: Column(
          children: [
            Container(
              width: 30,
              height: 7.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[600]!,
                      style: BorderStyle.solid,
                      width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 3),
            Container(
              width: 30,
              height: 7.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[600]!,
                      style: BorderStyle.solid,
                      width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
