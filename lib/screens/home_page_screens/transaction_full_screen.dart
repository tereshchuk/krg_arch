import 'package:krg_app/widgets/transcation_list.dart';
import 'package:flutter/material.dart';

class TransactionFullScreen extends StatefulWidget {
  const TransactionFullScreen({Key? key}) : super(key: key);

  @override
  _TransactionFullScreenState createState() => _TransactionFullScreenState();
}

class _TransactionFullScreenState extends State<TransactionFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: WaveClipperOne(flip: false),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .3,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Colors.purple[200],
          //           Colors.purple[200],
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // ClipPath(
          //   clipper: WaveClipperOne(flip: true),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * .15,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [
          //           Colors.blue[900],
          //           Colors.purple[400],
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .28,
            child: Image.asset(
              'images/image/header.png',
              color: Colors.purple[200],
              fit: BoxFit.fill,
            ),
          ),
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
                  top: 55, left: 30, right: 30, bottom: 10),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    // SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 9,
                            right: 9,
                            top: 90,
                            bottom: 10,
                          ),
                          child: Text(
                            "Transactions",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: TransactionList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 1.0),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          Spacer(),
          _moreOptions(),
        ],
      ),
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
