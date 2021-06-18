import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionDetail2Screen extends StatefulWidget {
  const TransactionDetail2Screen({Key? key}) : super(key: key);

  @override
  _TransactionDetail2ScreenState createState() =>
      _TransactionDetail2ScreenState();
}

class _TransactionDetail2ScreenState extends State<TransactionDetail2Screen> {
  final Widget svg = SvgPicture.asset('images/transaction-icon.svg',
      semanticsLabel: 'Empation');
  final Widget svg1 =
      SvgPicture.asset('images/check.svg', semanticsLabel: 'Money');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ClipPath(
          //   clipper: WaveClipperOne(flip: false),
          //   child: Container(
          //     height: MediaQuery.of(context).size.height * 0.19,
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
          //     height: MediaQuery.of(context).size.height * 0.08,
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
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: CustomScrollView(
                  slivers: [
                    appBarSimple(),
                    blockStacking(svg),
                    cardStacking(),
                    cardStacking1(),
                    cardStacking2(),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget appBarSimple() {
    return SliverToBoxAdapter(
      child: Padding(
          padding: EdgeInsets.only(top: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ))),
                      ))),
              Padding(
                  padding: EdgeInsets.only(left: 15, top: 0, right: 70),
                  child: Center(
                      child: Text("Transactions",
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
          ])),
    );
  }

  Widget blockStacking(final Widget svg) {
    return SliverToBoxAdapter(
        child: Align(
      alignment: Alignment.center,
      child: GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.only(
                right: 0,
                top: 115,
              ),
              child: Center(child: svg))),
    ));
  }

  Widget cardStacking() {
    return SliverToBoxAdapter(
        child: Center(
            child: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('Sender',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 15))),
        Container(
            margin: EdgeInsets.only(top: 5),
            constraints: BoxConstraints(maxWidth: 192),
            child: Text(
                'ouro1ftzad7ry49fjpp8jzcf0rpd7ry49fjpp8jzcd7ry49fjpp8jzc',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 15)))
      ],
    )));
  }

  Widget cardStacking1() {
    return SliverToBoxAdapter(
        child: Center(
            child: Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 69),
            child: Text('0,0033388146',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(171, 129, 245, 1),
                    fontSize: 30))),
        Container(
            margin: EdgeInsets.only(top: 5),
            constraints: BoxConstraints(maxWidth: 192),
            child: Text('KRG (7,57)',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 14)))
      ],
    )));
  }

  Widget cardStacking2() {
    return SliverToBoxAdapter(
        child: Center(
            child: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.only(top: 69),
            padding: EdgeInsets.all(16),
            child: Text('10',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14))),
        Container(
            margin: EdgeInsets.only(top: 5),
            child: Text('Nonce',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 15))),
        Container(
            margin: EdgeInsets.only(top: 14),
            child: Text('May 21, 2020 22:04:22',
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 15))),
        Container(
            width: 146,
            height: 55,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey, style: BorderStyle.solid, width: 1.0),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30.0),
            ),
            margin: EdgeInsets.only(top: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Row contents horizontally,
                crossAxisAlignment:
                    CrossAxisAlignment.center, //Center Row contents vertically,
                children: [
                  svg1,
                  Padding(
                      padding: EdgeInsets.only(left: 7),
                      child: Text('More Detail',
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 15)))
                ]))
      ],
    )));
  }
}
