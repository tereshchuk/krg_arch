import 'package:krg_app/widgets/popupOk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackingScreen3 extends StatefulWidget {
  @override
  _StackingScreenState3 createState() => _StackingScreenState3();
}

class _StackingScreenState3 extends State<StackingScreen3> {
  final Widget svg =
      SvgPicture.asset('images/empation1.svg', semanticsLabel: 'Acme Logo');
  final Widget svg1 =
      SvgPicture.asset('images/money.svg', semanticsLabel: 'Acme Logo');
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(44, 90, 255, 1),
                Color.fromRGBO(156, 109, 255, 1),
              ],
            )),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 90,
                  automaticallyImplyLeading: false,
                  backgroundColor: Color.fromRGBO(44, 90, 255, 1),
                  titleSpacing: 0.0,
                  title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return PopUpOkWidget(
                                              keyPass: "test_key",
                                              scaffoldkeys: _scaffoldKey);
                                        });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 30, top: 0),
                                    height: 45,
                                    width: 45,
                                    child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100)),
                                          color: Color.fromRGBO(44, 90, 255, 1),
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Icon(Icons.arrow_back))),
                                  ))),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 0, right: 70),
                              child: Center(
                                  child: Text("Home",
                                      style: TextStyle(
                                          height: 1,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 15)))),
                          Expanded(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 48,
                                        height: 48,
                                        margin: EdgeInsets.only(
                                          right: 21,
                                          top: 0,
                                        ),
                                        child: Center(
                                            child: Column(
                                          children: [
                                            Container(
                                              width: 23,
                                              height: 7,
                                              margin: EdgeInsets.only(top: 14),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                                color: Color.fromRGBO(
                                                    44, 90, 255, 1),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 3),
                                              width: 23,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 2,
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                                color: Color.fromRGBO(
                                                    44, 90, 255, 1),
                                              ),
                                            )
                                          ],
                                        ))))),
                          ),
                        ]),
                      ]),
                ),
                SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(left: 30, top: 12),
                                    child: Text("YOUR\nSTACKING",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                            fontSize: 30))),
                                Padding(
                                    padding: EdgeInsets.only(left: 30, top: 6),
                                    child: Text(
                                        "Smart account for\naccumulating funds.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 15)))
                              ]),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                    width: 55,
                                    margin: EdgeInsets.only(
                                      right: 30,
                                      top: 0,
                                    ),
                                    child: Center(child: svg))),
                          )),
                        ]),
                      ]),
                ),
                SliverToBoxAdapter(
                    child: Container(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 56),
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromRGBO(54, 171, 255, 1),
                                Color.fromRGBO(182, 88, 255, 1)
                              ],
                            )),
                        child: Column(
                          children: [
                            Wrap(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20, top: 12),
                                                child: Text('2 month',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        fontSize: 15))),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: 6, left: 20),
                                                child: Wrap(children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 6),
                                                      child: svg1),
                                                  Text("TOP UP",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize: 15))
                                                ]))
                                          ]),
                                      Expanded(
                                          child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Wrap(children: [
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 12),
                                                    child: Text("3.5 %",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.white,
                                                            fontSize: 15))),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8,
                                                        left: 8,
                                                        top: 12),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_right_alt_rounded,
                                                      color: Colors.white,
                                                      size: 18,
                                                    )),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10, top: 12),
                                                    child: Text("4 %",
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Colors.white,
                                                            fontSize: 15)))
                                              ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10, top: 6),
                                                  child: Text("4890.1947 KRG",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white,
                                                          fontSize: 19)))
                                            ]),
                                      )),
                                    ]),
                              ],
                            ),
                            Container(
                                width: double.infinity,
                                height: 1,
                                margin: EdgeInsets.only(
                                    left: 20, right: 10, top: 13),
                                color: Colors.white.withOpacity(0.3)),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Center(
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .center, //Center Row contents horizontally,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                          Container(
                                              /*  margin: EdgeInsets.only(
                                                      left: 7,
                                                      right: 7,
                                                      top: 7,
                                                      bottom: 7),*/

                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  width: 1,
                                                  color: Colors.white,
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(100)),
                                              ),
                                              child: Icon(
                                                Icons.check_sharp,
                                                color: Colors.white,
                                                size: 13,
                                              )),
                                          Text('Successful funds transfer!',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                        ]))))
                          ],
                        ))),
                SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text('Write-off amount: 4.000 KRG',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 14)))),
              ],
            )));
  }
}
