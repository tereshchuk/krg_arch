import 'dart:math' as math;
import 'package:krg_app/components/wallet/confirm_mnemonic.dart';
import 'package:krg_app/components/wallet/display_mnemonic.dart';
import 'package:krg_app/context/setup/wallet_setup_provider.dart';
import 'package:krg_app/screens/create_pin-code_screen.dart';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:krg_app/screens/create_pinCode_screen.dart';
import 'package:krg_app/screens/save_details_screen.dart';

import 'package:krg_app/components/wallet/confirm_mnemonic.dart';
import 'package:krg_app/context/setup/wallet_setup_provider.dart';
import 'package:krg_app/model/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:krg_app/components/wallet/confirm_mnemonic.dart';
import 'package:krg_app/context/setup/wallet_setup_provider.dart';
import 'package:krg_app/model/wallet_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:krg_app/components/wallet/display_mnemonic.dart';
/*
class CreateWalletScreen extends HookWidget {
  const CreateWalletScreen(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: store.state.step == WalletCreateSteps.display
          ? DisplayMnemonic(
              mnemonic: store.state.mnemonic!,
              onNext: () async {
                store.goto(WalletCreateSteps.confirm);
              },
            )
          : ConfirmMnemonic(
              errors: store.state.errors?.toList(),
              onConfirm: !store.state.loading
                  ? (confirmedMnemonic) async {
                      if (await store.confirmMnemonic(confirmedMnemonic)) {
                        Navigator.of(context).popAndPushNamed('/');
                      }
                    }
                  : null,
              onGenerateNew: !store.state.loading
                  ? () async {
                      store.generateMnemonic();
                      store.goto(WalletCreateSteps.display);
                    }
                  : null,
            ),
    );
  }
}

*/

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  _CreateWalletScreenState createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  String _seedContent =
      "lift empower mansion crack enough fence airport example sponsor kit bar private";
  String _passwordContent = "012dBshghEL";

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final store = useWalletSetup(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  headerIcon(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  seedInfo(),
                  SizedBox(height: 10),
                  seedContainer(),
                  SizedBox(height: 10),

                  store.state.step == WalletCreateSteps.display
                      ? DisplayMnemonic(
                          mnemonic: store.state.mnemonic!,
                          onNext: () async {
                            store.goto(WalletCreateSteps.confirm);
                          },
                        )
                      : ConfirmMnemonic(
                          errors: store.state.errors?.toList(),
                          onConfirm: !store.state.loading
                              ? (confirmedMnemonic) async {
                                  if (await store
                                      .confirmMnemonic(confirmedMnemonic)) {
                                    Navigator.of(context).popAndPushNamed('/');
                                  }
                                }
                              : null,
                          onGenerateNew: !store.state.loading
                              ? () async {
                                  store.generateMnemonic();
                                  store.goto(WalletCreateSteps.display);
                                }
                              : null,
                        ),

                  // Text(
                  //   "Password for browser encryption",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w500,
                  //       color: Colors.purple[300],
                  //       fontSize: 15),
                  // ),
                  // SizedBox(height: 10),
                  // passwordContainer(),
                  SizedBox(height: 10),
                  refreshData(),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // saveAll(),
                      goToWallet(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget goToWallet() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreatepinCodeScreen()),
        );
      },
      child: Container(
        width: 125,
        height: 50.0,
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
          child: Center(
            child: Text(
              'Go to Wallet',
              style: TextStyle(
                color: Colors.purple[300],
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget saveAll() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SaveDetailsScreen()),
        );
      },
      child: Container(
        width: 125,
        height: 50.0,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.purple[300]!,
                style: BorderStyle.solid,
                width: 1.0),
            color: Colors.purple[300],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.assignment_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 3),
              Text(
                'Save All',
                style: TextStyle(
                  color: Colors.white,
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

  Widget refreshData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.refresh_sharp,
          color: Colors.purple[300],
        ),
        SizedBox(width: 2),
        Text(
          "Refresh  Data",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.purple[300],
              fontSize: 15),
        ),
      ],
    );
  }

  Widget passwordContainer() {
    return Container(
      width: 500,
      height: 70.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.purple[300]!, style: BorderStyle.solid, width: 1.0),
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
                      _passwordContent,
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
                    await FlutterClipboard.copy(_passwordContent);
                    SnackBar snackbar =
                        SnackBar(content: Text("✓  Password Copied"));
                    // ignore: deprecated_member_use
                    _scaffoldKey.currentState!.showSnackBar(snackbar);
                    print(_passwordContent);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget seedContainer() {
    return Container(
      width: 500,
      height: 100.0,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.purple[300]!, style: BorderStyle.solid, width: 1.0),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 200,
                child: SingleChildScrollView(
                  child: Text(
                    _seedContent,
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
                  await FlutterClipboard.copy(_seedContent);
                  SnackBar snackbar =
                      SnackBar(content: Text("✓   Seed Copied"));
                  // ignore: deprecated_member_use
                  _scaffoldKey.currentState!.showSnackBar(snackbar);
                  print(_seedContent);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget seedInfo() {
    return Column(
      children: [
        Transform.rotate(
          angle: 180 * math.pi / 180,
          child: Icon(
            Icons.info_outline_rounded,
            size: 30,
            color: Colors.purple[300],
          ),
        ),
        SizedBox(height: 10),
        Text(
          'The seed is impossible to recover if lost',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.purple[300],
            fontSize: 15,
          ),
        ),
        Text(
          'Copy the generated seed to safe location.',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.purple[300],
            fontSize: 15,
          ),
        ),
        Text(
          "HDPathString: m/44'/60'/0'/0",
          style: TextStyle(
            fontWeight: FontWeight.w300,
            color: Colors.purple[300],
            fontSize: 15,
          ),
        ),
        Text(
          "Recover lost password using this seed.",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.purple[300],
            fontSize: 15,
          ),
        ),
        SizedBox(height: 15),
        Text(
          "Seed",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.purple[300],
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget headerIcon() {
    return Column(
      children: [
        Container(
          height: 40,
          child: Image.asset(
            'images/image/logo.png',
            color: Colors.purple[300],
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 30,
          child: Divider(color: Colors.purple[300], thickness: 2),
        ),
        SizedBox(height: 3),
        Text(
          'KRG',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple[300],
            fontSize: 20,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }
}
