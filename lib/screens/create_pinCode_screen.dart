import 'package:flutter/material.dart';
import 'package:krg_app/screens/finding_wallet_screen.dart';

class CreatepinCodeScreen extends StatefulWidget {
  CreatepinCodeScreen({Key? key}) : super(key: key);

  @override
  _CreatepinCodeScreenState createState() => _CreatepinCodeScreenState();
}

class _CreatepinCodeScreenState extends State<CreatepinCodeScreen> {
  var selectedindex = 0;
  String code = '';
  @override
  Widget build(BuildContext context) {
    print("Code is $code");
    return Scaffold(
      // key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topCenter,
              colors: [
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  headerIcon(),
                  pinCodeee(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pinCodeee() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 70),
        buildSecurityText(),
        SizedBox(height: 25),
        buildPinRow(),
        SizedBox(height: 40),
        buildNumPad(),
      ],
    );
  }

  buildSecurityText() {
    return Text(
      "Создайте PIN-код",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
    );
  }

  buildPinRow() {
    var width = MediaQuery.of(context).size.width;
    // var width;
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DigitHolder(
              width: width, index: 0, selectedIndex: selectedindex, code: code),
          DigitHolder(
              width: width, index: 1, selectedIndex: selectedindex, code: code),
          DigitHolder(
              width: width, index: 2, selectedIndex: selectedindex, code: code),
          DigitHolder(
              width: width, index: 3, selectedIndex: selectedindex, code: code),
        ],
      ),
    );
  }

  buildNumPad() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber(
                  number: "1",
                  onPressed: () {
                    addDigit(1);
                  },
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "2",
                  onPressed: () {
                    addDigit(2);
                  },
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "3",
                  onPressed: () {
                    addDigit(3);
                  },
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber(
                  number: "4",
                  onPressed: () {
                    addDigit(4);
                  },
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "5",
                  onPressed: () {
                    addDigit(5);
                  },
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "6",
                  onPressed: () {
                    addDigit(6);
                  },
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber(
                  number: "7",
                  onPressed: () {
                    addDigit(7);
                  },
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "8",
                  onPressed: () {
                    addDigit(8);
                  },
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "9",
                  onPressed: () {
                    addDigit(9);
                  },
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                KeyboardNumber1(
                  number: "0",
                ),
                SizedBox(width: 25),
                KeyboardNumber(
                  number: "0",
                  onPressed: () {
                    addDigit(0);
                  },
                ),
                SizedBox(width: 37),
                IconButton(
                  onPressed: () {
                    backspace();
                  },
                  icon: Icon(
                    Icons.backspace,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  addDigit(int digit) {
    if (code.length == 3) {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FindingWalletScreen()),
        );
      });
    }
    setState(() {
      code = code + digit.toString();
      print('Code is $code');
      selectedindex = code.length;
    });
  }

  backspace() {
    if (code.length == 0) {
      return;
    }
    setState(() {
      code = code.substring(0, code.length - 1);
      selectedindex = code.length;
    });
  }

  Widget headerIcon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
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

class KeyboardNumber extends StatelessWidget {
  final String? number;
  final Function()? onPressed;
  const KeyboardNumber({Key? key, this.number, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              number!,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KeyboardNumber1 extends StatelessWidget {
  final String? number;
  final Function()? onPressed;
  const KeyboardNumber1({Key? key, this.number, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.transparent,
                style: BorderStyle.solid,
                width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              number!,
              style: TextStyle(
                color: Colors.transparent,
                fontWeight: FontWeight.w400,
                fontSize: 24 * MediaQuery.of(context).textScaleFactor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DigitHolder extends StatelessWidget {
  final int? selectedIndex;
  final int? index;
  final String? code;
  const DigitHolder({
    @required this.selectedIndex,
    Key? key,
    @required this.width,
    this.index,
    this.code,
  }) : super(key: key);

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: width! * 0.05,
      width: width! * 0.05,
      margin: EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white12,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: index == selectedIndex
                  ? Colors.transparent
                  : Colors.transparent,
              offset: Offset(0, 0),
              spreadRadius: 1.5,
              blurRadius: 2,
            )
          ]),
      child: code!.length > index!
          ? PhysicalModel(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              elevation: 5,
              shadowColor: Colors.black,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  shape: BoxShape.circle,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.5),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                ),
              ),
            )
          : Container(),
    );
  }
}
