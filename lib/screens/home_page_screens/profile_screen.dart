import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:krg_app/screens/home_page_screens/menu_screen.dart';
import 'package:krg_app/widgets/curve_painter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool onTap = true;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _addressContent = "our1ftscchUUGUGU68dgfds99dsgdsvgihiviovhidshy";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: WaveClipperTwo(),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .35,
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
          CustomPaint(
            child: Container(
              height: MediaQuery.of(context).size.height * .25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue[900]!,
                    Colors.purple[400]!,
                  ],
                ),
                image: DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage(
                    'images/image/fade.png',
                  ),
                ),
              ),
            ),
            painter: CurvePainter(onTap),
          ),
          // ClipPath(
          //   clipper: OvalBottomBorderClipper(),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .30,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topLeft,
          //         end: Alignment.topRight,
          //         colors: [
          //           Colors.purple[400],
          //           Colors.blue[900],
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 10, right: 10, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    _imageHolder(),
                    _addressHolder(),
                    _emailAddress(),
                    _usernameContainer(),
                    _updateContainer(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _updateContainer() {
    return Align(
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 20),
        width: 200,
        height: 60.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.purple[300]!,
                style: BorderStyle.solid,
                width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.refresh_sharp,
                color: Colors.purple[300],
              ),
              SizedBox(width: 10),
              Text(
                'Update Pass',
                style: TextStyle(
                  color: Colors.purple[300],
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _usernameContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 13, left: 25.0, right: 25),
      child: Container(
        width: 500,
        height: 70.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid, width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        "@lewiz",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: 83 * math.pi / 22,
                    child: Icon(
                      Icons.send_sharp,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _emailAddress() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Container(
        width: 500,
        height: 70.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, style: BorderStyle.solid, width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        "eaaninwezi@gmail.com",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.email_outlined,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _addressHolder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              "Unique Wallet Address",
              style: TextStyle(
                color: Colors.purple[200],
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
        ),
        _addressContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Divider(),
        )
      ],
    );
  }

  _addressContainer() {
    return Padding(
      padding: const EdgeInsets.only(top: 7, left: 25.0, right: 25),
      child: Container(
        width: 500,
        height: 70.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.purple[300]!,
                style: BorderStyle.solid,
                width: 1.0),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    child: SingleChildScrollView(
                      child: Text(
                        _addressContent,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.purple[100],
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.content_copy_outlined,
                      color: Colors.purple[300],
                    ),
                    onPressed: () async {
                      await FlutterClipboard.copy(_addressContent);
                      SnackBar snackbar =
                          SnackBar(content: Text("✓  Address Copied"));
                      // ignore: deprecated_member_use
                      _scaffoldKey.currentState!.showSnackBar(snackbar);
                      print(_addressContent);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _imageHolder() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        child: Stack(
          children: [
            Container(
              height: 110.0,
              width: 110.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/image/profile.jpg"),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.0),
              ),
            ),
            Positioned(
              left: 80,
              bottom: 10,
              child: Container(
                // height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.blue[900],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.logout,
          color: Colors.white,
        ),
        Text(
          "Aninwezi  Emmanuel",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
        _moreOptions(),
      ],
    );
  }

  _moreOptions() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
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
                      color: Colors.white,
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
