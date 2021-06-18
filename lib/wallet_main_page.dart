import 'package:krg_app/components/wallet/balance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:krg_app/screens/home_page_screens/profile_screen.dart';
import 'dart:math' as math;

import 'components/dialog/alert.dart';
import 'components/menu/main_menu.dart';
import 'context/wallet/wallet_provider.dart';
import 'screens/home_page_screens/menu_screen.dart';
import 'screens/home_page_screens/transaction_full_screen.dart';
import 'screens/stacking_screen/stacking_screen.dart';
import 'utils/eth_amount_formatter.dart';
import 'widgets/curve_painter.dart';
import 'widgets/transaction_widget.dart';

class WalletMainPage extends HookWidget {
  WalletMainPage(this.title, {Key? key}) : super(key: key);

  final String title;

  bool onTap = true;

  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);

    useEffect(() {
      store.initialise();
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
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
                    _header(context),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        //"\u00244700",

                        "ETH ${EthAmountFormatter(store.state.ethBalance).format()}",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 65,
                        ),
                      ),
                    ),
                    _subHeader(store.state.tokenBalance),
                    Balance(
                      address: store.state.address,
                      ethBalance: store.state.ethBalance,
                      tokenBalance: store.state.tokenBalance,
                    ),
                    SizedBox(height: 10),
                    settingSummary(),
                    SizedBox(height: 35),
                    stackingContainer(context),
                    GestureDetector(
                        onTap: () {
                          store.fetchOwnBalance();
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Balance updated'),
                            duration: Duration(milliseconds: 800),
                          ));
                        },
                        child: Text('обновить')),
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

  _subHeader(BigInt token) {
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
          "${EthAmountFormatter(token).format()} KRG",
          style: TextStyle(
            color: Colors.white54,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  _header(context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            child: Container(
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
            )),
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
        _moreOptions(context),
      ],
    );
  }

  _moreOptions(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/transfer');
        /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuScreen()),
        );
        */
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

  Widget stackingContainer(BuildContext context) {
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

/*
  @override
  Widget build(BuildContext context) {
    final store = useWallet(context);

    useEffect(() {
      store.initialise();
      return null;
    }, []);

    return Scaffold(
      drawer: MainMenu(
        address: store.state.address,
        onReset: () => Alert(
            title: 'Warning',
            text:
                'Without your seed phrase or private key you cannot restore your wallet balance',
            actions: [
              TextButton(
                child: const Text('cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('reset'),
                onPressed: () async {
                  await store.resetWallet();
                  Navigator.popAndPushNamed(context, '/');
                },
              )
            ]).show(context),
        onRevealKey: () => Alert(
            title: 'Private key',
            text:
                'WARNING: In production environment the private key should be protected with password.\r\n\r\n${store.getPrivateKey() ?? "-"}',
            actions: [
              TextButton(
                child: const Text('close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: const Text('copy and close'),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: store.getPrivateKey()));
                  Navigator.of(context).pop();
                },
              ),
            ]).show(context),
      ),
      appBar: AppBar(
        title: Text(title),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: !store.state.loading
                  ? () async {
                      await store.fetchOwnBalance();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Balance updated'),
                        duration: Duration(milliseconds: 800),
                      ));
                    }
                  : null,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              Navigator.of(context).pushNamed('/transfer');
            },
          ),
        ],
      ),
      body: Balance(
        address: store.state.address,
        ethBalance: store.state.ethBalance,
        tokenBalance: store.state.tokenBalance,
      ),
    );
  }*/
}
