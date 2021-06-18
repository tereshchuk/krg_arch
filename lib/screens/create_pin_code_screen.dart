// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:passcode_screen/circle.dart';
// import 'package:passcode_screen/keyboard.dart';
// import 'package:passcode_screen/passcode_screen.dart';
// import 'package:krg_app/screens/finding_wallet_screen.dart';

// class CreatePinCodeScreen extends StatefulWidget {
//   const CreatePinCodeScreen({Key? key}) : super(key: key);

//   @override
//   _CreatePinCodeScreenState createState() => _CreatePinCodeScreenState();
// }

// class _CreatePinCodeScreenState extends State<CreatePinCodeScreen> {
//   bool isAuthenticated = false;
//   final StreamController<bool> _verificationNotifier =
//       StreamController<bool>.broadcast();
//   @override
//   void dispose() {
//     _verificationNotifier.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
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
//                   passwordSection(context),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget passwordSection(BuildContext _context,
//       {CircleUIConfig? circleUIConfig,
//       KeyboardUIConfig? keyboardUIConfig,
//       Widget? cancelButton,
//       List<String>? digits}) {
//     return Container(
//       height: 500,
//       child: PasscodeScreen(
//         backgroundColor: Colors.transparent,
//         title: Text(
//           "Создайте PIN-код",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//             fontSize: 17,
//           ),
//         ),
//         cancelButton: Text(
//           "Cancel",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//             fontSize: 17,
//           ),
//         ),
//         deleteButton: Text(
//           "Delete",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w400,
//             fontSize: 17,
//           ),
//         ),
//         // isValidCallback: null,
//         circleUIConfig: circleUIConfig,
//         keyboardUIConfig: keyboardUIConfig,
//         digits: digits,
//         passwordDigits: 4,
//         cancelCallback: _passcodeCancelled,
//         passwordEnteredCallback: _passcodeEntered,
//         shouldTriggerVerification: _verificationNotifier.stream,
//       ),
//     );
//   }

//   _passcodeEntered(String enteredPasscode) {
//     bool isValid = "1234" == enteredPasscode;
//     _verificationNotifier.add(isValid);
//     if (isValid) {
//       setState(() {
//         this.isAuthenticated = isValid;
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => FindingWalletScreen()),
//         );
//       });
//       print("Pin was Created Successfully");
//     }
//   }

//   _passcodeCancelled() {
//     Navigator.maybePop(context);
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
