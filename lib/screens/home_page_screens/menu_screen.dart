import 'package:krg_app/screens/home_page_screens/profile_screen.dart';
import 'package:krg_app/screens/home_page_screens/settings_screen.dart';
import 'package:krg_app/screens/home_page_screens/technical_support_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool onTap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: WaveClipperTwo(),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .40,
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

          // CustomPaint(
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .30,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
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
          //   painter: CurvePainter(onTap),
          // ),

          Container(
            // width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .55,
            child: Image.asset(
              'images/image/header.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    SizedBox(height: 30),
                    _icons(),
                    SizedBox(height: 80),
                    _technicalSupport(),
                    SizedBox(height: 80),
                    _services(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _technicalSupport() {
    return Row(
      children: [
        Icon(
          Icons.question_answer_outlined,
          color: Colors.white,
          size: 35,
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TechnicalSupportScrren()),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Technical support",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Text(
                "We will answer your questions",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              Container(
                width: 250,
                child: Divider(color: Colors.white, thickness: 0.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _services() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Services",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        Text(
          "When you connect these services,\nimportant information about them\nwillappear in your profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  _icons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.person_outline_sharp,
                color: Colors.white,
                size: 35,
              ),
              Text(
                "Personal",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Icon(
              Icons.group_outlined,
              color: Colors.white,
              size: 35,
            ),
            Text(
              "Friend List",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
          child: Column(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
                size: 35,
              ),
              Text(
                "Settings",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _header() {
    return Row(
      children: [
        Container(
          height: 70.0,
          width: 70.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/image/profile.jpg"),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.0),
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Aninwezi",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  "Lewiz",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            Text(
              "07 July 2021",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ],
        ),
        Spacer(),
        _moreOptions(),
      ],
    );
  }

  _moreOptions() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        child: Row(
          children: [
            Container(
              width: 7,
              height: 30.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(width: 3),
            Container(
              width: 7,
              height: 30.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white,
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
