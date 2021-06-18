// import 'package:krg_app/screens/home_page_screens/menu_screen.dart';
// import 'package:flutter/material.dart';

// class StackingScreen extends StatefulWidget {
//   const StackingScreen({Key key}) : super(key: key);

//   @override
//   _StackingScreenState createState() => _StackingScreenState();
// }

// class _StackingScreenState extends State<StackingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.blue[900],
//                   Colors.purple[400],
//                 ],
//               ),
//             ),
//           ),
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.only(
//                   top: 40, left: 30, right: 30, bottom: 10),
//               child: SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _header(),
//                     _stackingHeader(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _stackingHeader() {
//     return Padding(
//       padding: const EdgeInsets.only(top: 40, bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "YOUR\nSTACKING",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 25,
//                 ),
//               ),
//               Text(
//                 "Smart account for\naccumulating funds.",
//                 style: TextStyle(
//                   color: Colors.white60,
//                   fontWeight: FontWeight.w400,
//                   fontSize: 17,
//                 ),
//               ),
//             ],
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0, right: 15),
//             child: Container(
//               height: 40,
//               child: Image.asset(
//                 'images/image/stack.png',
//                 color: Colors.white,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   _header() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 9),
//       child: Row(
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                     color: Colors.white, style: BorderStyle.solid, width: 1.0),
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(30.0),
//               ),
//               child: Icon(
//                 Icons.arrow_back,
//                 color: Colors.white,
//                 size: 25,
//               ),
//             ),
//           ),
//           SizedBox(width: 15),
//           Text(
//             "Home",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.w400,
//               fontSize: 15,
//             ),
//           ),
//           Spacer(),
//           _moreOptions(),
//         ],
//       ),
//     );
//   }

//   _moreOptions() {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MenuScreen()),
//         );
//       },
//       child: Container(
//         child: Column(
//           children: [
//             Container(
//               width: 30,
//               height: 7.0,
//               color: Colors.transparent,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: Colors.white,
//                       style: BorderStyle.solid,
//                       width: 2.0),
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 3),
//             Container(
//               width: 30,
//               height: 7.0,
//               color: Colors.transparent,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                       color: Colors.white,
//                       style: BorderStyle.solid,
//                       width: 2.0),
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(30.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
