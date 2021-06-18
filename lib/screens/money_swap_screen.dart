import 'package:flutter/material.dart';

class MoneySwapScreen extends StatefulWidget {
  @override
  _MoneySwapScreenState createState() => _MoneySwapScreenState();
}

class _MoneySwapScreenState extends State<MoneySwapScreen> {
  String? _currency = "BTC";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(40, 36, 248, 1),
                Color.fromRGBO(173, 0, 255, 1),
              ],
            )),
            child: CustomScrollView(
              slivers: [
                appBarSimple(),
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(
                        child: Container(
                            transform:
                                Matrix4.translationValues(0.0, -45.0, 0.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                        Positioned(
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                              Text(
                                                  _currency == "BTC"
                                                      ? '12,230'
                                                      : "0,0429",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                      fontSize: 60)),
                                              Text('Last update at 9 min.',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white
                                                          .withOpacity(0.3),
                                                      fontSize: 15)),
                                            ])),
                                        Positioned(
                                            child: new DropdownButton<String>(
                                          iconEnabledColor: Colors.white,
                                          iconDisabledColor: Colors.white,
                                          underline: Container(),

                                          isDense: true,
                                          hint: Center(
                                              child: Container(
                                                  width: 200,
                                                  height: 55,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        child: Text(_currency!,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 14)),
                                                      ),
                                                      Icon(
                                                        /* _icondrop
                                                            ? Icons
                                                                .arrow_drop_up_outlined
                                                            : */
                                                        Icons
                                                            .arrow_drop_down_outlined,
                                                        size: 24,
                                                        color: Colors.white,
                                                      )
                                                    ],
                                                  ))),
                                          // icon: Icon(Icons.ac_unit),
                                          dropdownColor: Colors.transparent,
                                          elevation: 0,

                                          iconSize: 0,
                                          icon: Container(),
                                          items: <String>[
                                            'BTC',
                                            'KRG',
                                            'ETH',
                                            'USDT'
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                                value: value,
                                                child: Container(
                                                    width: 200,
                                                    padding: EdgeInsets.only(
                                                        bottom: value == 'USDT'
                                                            ? 40
                                                            : 0),
                                                    child: Center(
                                                      child: new Text(value,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: value ==
                                                                      _currency
                                                                  ? Colors.white
                                                                  : Colors.white
                                                                      .withOpacity(
                                                                          0.3),
                                                              fontSize: 30)),
                                                    )));
                                          }).toList(),
                                          onChanged: (value) {
                                            setState(() {
                                              _currency = value;
                                              //_icondrop = false;
                                            });
                                          },
                                        ))
                                      ]))
                                ])))),
              ],
            )));
  }

  Widget appBarSimple() {
    return SliverAppBar(
      toolbarHeight: 90,
      //collapsedHeight: 170,
      automaticallyImplyLeading: false,
      backgroundColor: Color.fromRGBO(40, 36, 248, 1),

      titleSpacing: 0.0,
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {},
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
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Icon(Icons.arrow_back))),
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 15, top: 0, right: 70),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
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
                              ),
                            )
                          ],
                        ))))),
          ),
        ]),
      ]),
    );
  }
}
