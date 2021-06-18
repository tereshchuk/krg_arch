// import 'package:krg_app/screens/finding_wallet_screen.dart';
// import 'package:flutter/material.dart';

// class PinCodeScreen extends StatefulWidget {
//   @override
//   _PinCodeScreenState createState() => _PinCodeScreenState();
// }

// class _PinCodeScreenState extends State<PinCodeScreen> {
//   List<String> currentPin = ["", "", "", ""];
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController pinOneController = TextEditingController();
//   TextEditingController pinTwoController = TextEditingController();
//   TextEditingController pinThreeController = TextEditingController();
//   TextEditingController pinFourController = TextEditingController();

//   var outlineInputBorder = OutlineInputBorder(
//     borderRadius: BorderRadius.circular(20),
//     borderSide: BorderSide.none,
//   );

//   int pinIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SingleChildScrollView(
//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.topCenter,
//               colors: [
//                 Colors.purple[600]!,
//                 Colors.purple[700]!,
//               ],
//             ),
//           ),
//           child: Padding(
//             padding:
//                 const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 10),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   headerIcon(),
//                   pinCodeee(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   pinCodeee() {
//     return Column(
//       children: [
//         SizedBox(height: 70),
//         buildSecurityText(),
//         SizedBox(height: 25),
//         buildPinRow(),
//         SizedBox(height: 20),
//         buildNumPad(),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _createPin(),
//             _cancelPin(),
//           ],
//         )
//       ],
//     );
//   }

//   _cancelPin() {
//     return GestureDetector(
//       onTap: () {
//         clearPin();
//       },
//       child: Container(
//         width: 120,
//         height: 45.0,
//         color: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: Colors.white, style: BorderStyle.solid, width: 1.0),
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Center(
//             child: Text(
//               "Cancel",
//               style: TextStyle(
//                 color: Colors.red,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 17,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _createPin() {
//     return GestureDetector(
//       onTap: () {
//         if (pinFourController.text.isNotEmpty) {
//           Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(builder: (context) => FindingWalletScreen()),
//               (route) => false);
//           print("Your Pinn is " +
//               pinOneController.text +
//               pinTwoController.text +
//               pinThreeController.text +
//               pinFourController.text);
//         } else {
//           SnackBar snackbar =
//               SnackBar(content: Text("Your Pin Must Contain 4 digits!"));
//           // ignore: deprecated_member_use
//           _scaffoldKey.currentState!.showSnackBar(snackbar);
//         }
//       },
//       child: Container(
//         width: 120,
//         height: 45.0,
//         color: Colors.transparent,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.transparent,
//               style: BorderStyle.solid,
//               width: 1.0,
//             ),
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Center(
//             child: Text(
//               "Create Pin",
//               style: TextStyle(
//                 color: Colors.purple[300],
//                 fontWeight: FontWeight.w400,
//                 fontSize: 17,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   buildNumPad() {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       child: Padding(
//         padding: const EdgeInsets.only(bottom: 32),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 KeyboardNumber(
//                   n: 1,
//                   onPressed: () {
//                     pinIndexSetup("1");
//                   },
//                 ),
//                 KeyboardNumber(
//                   n: 2,
//                   onPressed: () {
//                     pinIndexSetup("2");
//                   },
//                 ),
//                 KeyboardNumber(
//                   n: 3,
//                   onPressed: () {
//                     pinIndexSetup("3");
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 KeyboardNumber(
//                   n: 4,
//                   onPressed: () {
//                     pinIndexSetup("4");
//                   },
//                 ),
//                 KeyboardNumber(
//                   n: 5,
//                   onPressed: () {
//                     pinIndexSetup("5");
//                   },
//                 ),
//                 KeyboardNumber(
//                   n: 6,
//                   onPressed: () {
//                     pinIndexSetup("6");
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 KeyboardNumber(
//                   n: 7,
//                   onPressed: () {
//                     pinIndexSetup("7");
//                   },
//                 ),
//                 KeyboardNumber(
//                   n: 8,
//                   onPressed: () {
//                     pinIndexSetup("8");
//                   },
//                 ),
//                 KeyboardNumber(
//                   n: 9,
//                   onPressed: () {
//                     pinIndexSetup("9");
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 KeyboardNumber(
//                   n: 0,
//                   onPressed: () {
//                     pinIndexSetup("0");
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   clearPin() {
//     if (pinIndex == 0)
//       pinIndex = 0;
//     else if (pinIndex == 4) {
//       setPin(pinIndex, "");
//       currentPin[pinIndex - 1] = "";
//       pinIndex--;
//     } else {
//       setPin(pinIndex, "");
//       currentPin[pinIndex - 1] = "";
//       pinIndex--;
//     }
//   }

//   pinIndexSetup(String text) {
//     if (pinIndex == 0)
//       pinIndex = 1;
//     else if (pinIndex < 4) pinIndex++;
//     setPin(pinIndex, text);
//     currentPin[pinIndex - 1] = text;
//     String strPin = "";
//     currentPin.forEach((e) {
//       strPin += e;
//     });
//     if (pinIndex == 4) print(strPin);
//   }

//   setPin(int n, String text) {
//     switch (n) {
//       case 1:
//         pinOneController.text = text;
//         break;
//       case 2:
//         pinTwoController.text = text;
//         break;
//       case 3:
//         pinThreeController.text = text;
//         break;
//       case 4:
//         pinFourController.text = text;
//         break;
//     }
//   }

//   buildPinRow() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 70, right: 70),
//       child: Row(
//         // mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           PinNumber(
//             // outlineInputBorder: outlineInputBorder,
//             textEditingController: pinOneController,
//           ),
//           PinNumber(
//             // outlineInputBorder: outlineInputBorder,
//             textEditingController: pinTwoController,
//           ),
//           PinNumber(
//             // outlineInputBorder: outlineInputBorder,
//             textEditingController: pinThreeController,
//           ),
//           PinNumber(
//             // outlineInputBorder: outlineInputBorder,
//             textEditingController: pinFourController,
//           ),
//         ],
//       ),
//     );
//   }

//   buildSecurityText() {
//     return Text(
//       "Создайте PIN-код",
//       style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.w400,
//         fontSize: 17,
//       ),
//     );
//   }

//   Widget headerIcon() {
//     return Column(
//       children: [
//         Container(
//           height: 40,
//           child: Image.asset(
//             'images/image/logo.png',
//             fit: BoxFit.cover,
//           ),
//         ),
//         Container(
//           width: 30,
//           child: Divider(color: Colors.white, thickness: 2),
//         ),
//         SizedBox(height: 3),
//         Text(
//           'KRG',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             fontSize: 20,
//             letterSpacing: 2,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PinNumber extends StatelessWidget {
//   final TextEditingController? textEditingController;
//   final OutlineInputBorder? outlineInputBorder;

//   const PinNumber({this.textEditingController, this.outlineInputBorder});
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // color: Colors.red,
//       width: 20,
//       height: 20,
//       child: Center(
//         child: Container(
//           // decoration: BoxDecoration(
//           //   // border: Border.all(
//           //   //     color: Colors.white, style: BorderStyle.solid, width: 1.0),
//           //   color: Colors.red,
//           //   border: Border.all(width: 2),
//           //   shape: BoxShape.circle,
//           //   // borderRadius: BorderRadius.circular(0.0),
//           // ),
//           child: Container(
//             width: double.infinity,
//             height: double.infinity,
//             child: Align(
//               alignment: Alignment.center,
//               child: TextField(
//                 controller: textEditingController,
//                 enabled: false,
//                 obscureText: true,
//                 textAlign: TextAlign.center,
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.all(0),
//                   border: outlineInputBorder,
//                   filled: true,
//                   fillColor: Colors.transparent,
//                 ),
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 40,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class KeyboardNumber extends StatelessWidget {
//   final int? n;
//   final Function()? onPressed;
//   const KeyboardNumber({Key? key, this.n, this.onPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 60,
//       height: 60,
//       child: GestureDetector(
//         onTap: onPressed,
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//                 color: Colors.white, style: BorderStyle.solid, width: 1.0),
//             color: Colors.transparent,
//             borderRadius: BorderRadius.circular(30.0),
//           ),
//           child: Center(
//             child: Text(
//               "$n",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 24 * MediaQuery.of(context).textScaleFactor,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
