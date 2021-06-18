import 'dart:math' as math;
import 'package:krg_app/screens/home_page_screens/menu_screen.dart';
import 'package:krg_app/screens/home_page_screens/transaction_full_screen.dart';
import 'package:krg_app/widgets/curve_painter.dart';
import 'package:krg_app/widgets/transaction_widget.dart';
import 'package:flutter/material.dart';
import '../stacking_screen/stacking_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool onTap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: WaveClipperOne(),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .40,
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
          // ),
          CustomPaint(
            child: Container(
              height: MediaQuery.of(context).size.height * .35,
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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: 30, right: 30, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "\u00244700",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 65,
                        ),
                      ),
                    ),
                    _subHeader(),
                    SizedBox(height: 10),
                    settingSummary(),
                    SizedBox(height: 35),
                    stackingContainer(),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Text(
                            "Transactions",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TransactionFullScreen()),
                              );
                            },
                            child: Transform.rotate(
                              angle: 90 * math.pi / 12,
                              child: IconButton(
                                icon: Icon(Icons.expand_more_sharp),
                                onPressed: null,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    TranactionWidget(),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _subHeader() {
    return Row(
      children: [
        Container(
          width: 65,
          height: 25.0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.white, style: BorderStyle.solid, width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                'KRG',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Text(
          '12 230KRG',
          style: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.w400,
            fontSize: 15,
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
        Spacer(),
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

  Widget stackingContainer() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StackingScreen()),
        );
      },
      child: Align(
        child: Container(
          height: 100,
          width: 315,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [.4, .9],
              colors: [
                Colors.blue[700]!,
                Colors.purple[300]!,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "YOUR\nSTACKING",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, right: 15),
                      child: Container(
                        height: 40,
                        child: Image.asset(
                          'images/image/stack.png',
                          color: Colors.white,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Now 4.5%',
                  style: TextStyle(
                    color: Colors.white60,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget settingSummary() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.settings,
                size: 17,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _krg(),
                Container(
                  width: 1.0,
                  height: 23.0,
                  color: Colors.black45,
                ),
                _dol(),
                Container(
                  width: 1.0,
                  height: 23.0,
                  color: Colors.black45,
                ),
                _euro(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _krg() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'KRG',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text(
                  '0.3841\u20BD',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.lightGreenAccent[700],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _dol() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DOL.',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text(
                  '73.231\u20BD',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.lightGreenAccent[700],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  _euro() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'EURO',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Text(
                  '80.341\u20BD',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.lightGreenAccent[700],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
