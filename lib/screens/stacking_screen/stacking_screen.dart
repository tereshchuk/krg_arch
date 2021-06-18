import 'package:krg_app/models/transactions_model.dart';
import 'package:krg_app/screens/create_pin-code_screen.dart';
import 'package:krg_app/screens/stacking_screen/stacking_screen1.dart';
import 'package:krg_app/screens/stacking_screen/stacking_screen2.dart';
import 'package:flutter/material.dart';
import 'package:krg_app/screens/create_wallet_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StackingScreen extends StatefulWidget {
  @override
  _StackingScreenState createState() => _StackingScreenState();
}

class _StackingScreenState extends State<StackingScreen> {
  // final String assetName1 = 'images/empation1.svg';
  //final String assetName2 = 'images/money.svg';

  final Widget svg =
      SvgPicture.asset('images/empation1.svg', semanticsLabel: 'Empation');
  final Widget svg1 =
      SvgPicture.asset('images/money.svg', semanticsLabel: 'Money');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            appBarSimple(),
            blockStacking(svg),
            cardStacking(),
            buttonStacking(svg1),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 45, right: 30, left: 30, bottom: 15),
                child: Text(
                  'Stacking history',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            listStacking()
          ],
        ),
      ),
    );
  }

  Widget appBarSimple() {
    return SliverAppBar(
      toolbarHeight: 90,
      //collapsedHeight: 170,
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromRGBO(44, 90, 255, 1),

      titleSpacing: 0.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 30, top: 0),
                    height: 40,
                    width: 40,
                    child: Container(
                        /*  margin: EdgeInsets.only(
                                                      left: 7,
                                                      right: 7,
                                                      top: 7,
                                                      bottom: 7),*/
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(44, 90, 255, 1),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Icon(Icons.arrow_back))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 0, right: 70),
                child: Center(
                  child: Text(
                    "Home",
                    style: TextStyle(
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Color.fromRGBO(44, 90, 255, 1),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Color.fromRGBO(44, 90, 255, 1),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockStacking(final Widget svg) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    child: Text("Smart account for\naccumulating funds.",
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
                      child: Center(
                        child: svg,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget cardStacking() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 56),
        width: double.infinity,
        height: 82,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(54, 171, 255, 1),
        ),
        child: Column(
          children: [
            Wrap(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12, top: 12),
                      child: Text(
                        '2 month',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Wrap(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 12),
                                  child: Text(
                                    "3.5 %",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: 8, left: 8, top: 12),
                                  child: Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 12, top: 12),
                                  child: Text(
                                    "4 %",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12, top: 6),
                              child: Text(
                                "4890.1947 KRG",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonStacking(final Widget svg1) {
    return SliverToBoxAdapter(
        child: Center(
            child: Wrap(children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StackingScreen1()),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Wrap(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 6),
                  child: Icon(Icons.account_balance_wallet_outlined,
                      size: 19, color: Colors.white.withOpacity(0.7))),
              Text(
                "CASH OUT",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
      Container(
        width: 1,
        height: 23,
        margin: EdgeInsets.only(top: 37, right: 25, left: 25),
        color: Colors.white.withOpacity(0.3),
      ),
      GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => StackingScreen2()),
            );
          },
          child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Wrap(alignment: WrapAlignment.center, children: [
                Padding(padding: EdgeInsets.only(right: 6), child: svg1),
                Text("TOP UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 15))
              ])))
    ])));
  }

  Widget listStacking() {
    return SliverPadding(
        padding: EdgeInsets.only(bottom: 30.0),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(top: 12, left: 30, right: 30),
                  height: 58,
                  child: Center(
                      child: ListTile(
                    title: Row(children: [
                      Container(
                          width: 45,
                          height: 45,
                          margin: const EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                          ),
                          child: Icon(
                            index == 1 ? Icons.remove_outlined : Icons.add,
                            color: Colors.white,
                          )), //remove_outlined
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Private wallet',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15)),
                            index != 1
                                ? Text("Sport Market",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white.withOpacity(0.3),
                                        fontSize: 14))
                                : Wrap(children: [
                                    Padding(
                                        padding: EdgeInsets.only(),
                                        child: Text("3.5 %",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                fontSize: 15))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          right: 8,
                                          left: 8,
                                        ),
                                        child: Icon(
                                          Icons.arrow_right_alt_rounded,
                                          color: Colors.white.withOpacity(0.3),
                                          size: 18,
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(right: 12),
                                        child: Text("4 %",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white
                                                    .withOpacity(0.3),
                                                fontSize: 15)))
                                  ]),
                          ]),
                    ]),
                    contentPadding: EdgeInsets.only(left: 0, right: 12),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('+ 4.82 KRG',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 15)),
                          Text("03/24/2021",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white.withOpacity(0.3),
                                  fontSize: 14))
                        ]),
                  )));
            },
            childCount: 121,
          ),
        ));
  }
}
