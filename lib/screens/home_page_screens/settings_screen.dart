import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:krg_app/screens/home_page_screens/technical_support_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool onTap = true;
  bool turnOnNotifications = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          // CustomPaint(
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .0,
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
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    _headerText(),
                    SizedBox(height: 80),
                    _expandedLanguageWidget(),
                    // _languageContainer(),
                    SizedBox(height: 30),
                    _pushNotification(),
                    SizedBox(height: 30),
                    _technicalSupport(),

                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _logoutButton(),
                          Spacer(),
                          _deleteButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _deleteButton() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => SaveDetailsScreen()),
        // );
      },
      child: Container(
        width: 125,
        height: 50.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.red[300]!, style: BorderStyle.solid, width: 1.0),
            color: Colors.red[300],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
            child: Text(
              'Delete Wallet',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _logoutButton() {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => PinCodeScreen()),
        // );
      },
      child: Container(
        width: 125,
        height: 50.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.red[300]!, style: BorderStyle.solid, width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Center(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.logout,
                color: Colors.red[300],
                size: 20,
              ),
              SizedBox(width: 3),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red[300],
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  _expandedLanguageWidget() {
    // return ExpandablePanel(
    //   // ignore: deprecated_member_use
    //   headerAlignment: ExpandablePanelHeaderAlignment.center,
    //   header: _expandedHeader(),
    //   // ignore: deprecated_member_use
    //   hasIcon: true,
    //   // ignore: deprecated_member_use
    //   iconColor: Colors.purple[400],
    //   // ignore: deprecated_member_use
    //   tapBodyToCollapse: true,
    //   // ignore: deprecated_member_use
    //   tapHeaderToExpand: true,
    //   collapsed: _collapsedBody(),
    // );
    // ignore: missing_required_param
    return ExpandablePanel(
      expanded: Container(),
      header: _expandedHeader(),
      collapsed: _collapsedBody(),
      theme: ExpandableThemeData(
        iconColor: Colors.purple[400],
        hasIcon: true,
      ),
    );
  }

  _collapsedBody() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "English",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 150),
              Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey[800],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Русский",
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Deutsch",
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _expandedHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20,
          child: Image.asset(
            'images/image/language.png',
            fit: BoxFit.cover,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Language",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            Text(
              "English",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            Container(
              width: 210,
              child: Divider(color: Colors.grey[600], thickness: 0.5),
            ),
          ],
        ),
      ],
    );
  }

  _pushNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.push_pin_outlined,
          color: Colors.grey[600],
          size: 20,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Push-Notifications",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            Text(
              "Click on the switch to turn it on",
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            Container(
              width: 210,
              child: Divider(color: Colors.grey[600], thickness: 0.5),
            ),
          ],
        ),
        Spacer(),
        Transform.rotate(
          angle: 90 * math.pi / 12,
          child: Switch(
            activeColor: Colors.purple[400],
            value: turnOnNotifications,
            onChanged: (bool value) {
              setState(() {
                turnOnNotifications = value;
              });
            },
          ),
        ),
      ],
    );
  }

  // _languageContainer() {
  //   return Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         height: 20,
  //         child: Image.asset(
  //           'images/image/language.png',
  //           fit: BoxFit.cover,
  //           color: Colors.grey[600],
  //         ),
  //       ),
  //       SizedBox(width: 5),
  //       GestureDetector(
  //         onTap: () {
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => TechnicalSupportScrren()),
  //           );
  //         },
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Language",
  //               style: TextStyle(
  //                 color: Colors.grey[600],
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 17,
  //               ),
  //             ),
  //             Text(
  //               "English",
  //               style: TextStyle(
  //                 color: Colors.grey[600],
  //                 fontWeight: FontWeight.w400,
  //                 fontSize: 15,
  //               ),
  //             ),
  //             Container(
  //               width: 210,
  //               child: Divider(color: Colors.grey[600], thickness: 0.5),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Spacer(),
  //       GestureDetector(
  //         child: Transform.rotate(
  //           angle: 90 * math.pi / 12,
  //           child: IconButton(
  //             icon: Icon(Icons.expand_more_sharp),
  //             onPressed: null,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  _technicalSupport() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.question_answer_outlined,
          color: Colors.grey[600],
          size: 20,
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
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              Text(
                "We will answer your questions",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              Container(
                width: 210,
                child: Divider(color: Colors.grey[600], thickness: 0.5),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _headerText() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "YOUR\nSETTINGS",
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              "Change your wallet to your liking.",
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
