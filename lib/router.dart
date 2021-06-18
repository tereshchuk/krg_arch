import 'package:krg_app/qrcode_reader_page.dart';
import 'package:krg_app/screens/home_page_screens/profile_screen.dart';
import 'package:krg_app/screens/loading_screen.dart';
import 'package:krg_app/service/configuration_service.dart';
import 'package:krg_app/wallet_create_page.dart';
import 'package:krg_app/wallet_import_page.dart';
import 'package:krg_app/wallet_main_page.dart';
import 'package:krg_app/wallet_transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

import 'context/setup/wallet_setup_provider.dart';
import 'context/transfer/wallet_transfer_provider.dart';
import 'context/wallet/wallet_provider.dart';
import 'intro_page.dart';

Map<String, WidgetBuilder> getRoutes(context) {
  return {
    '/': (BuildContext context) {
      final configurationService = Provider.of<ConfigurationService>(context);
      if (configurationService.didSetupWallet())
        return WalletProvider(
            // ignore: prefer_const_constructors
            builder: (context, store) => WalletMainPage('Your wallet'));

      return LoadingScreen();
    },
    '/create': (BuildContext context) =>
        WalletSetupProvider(builder: (context, store) {
          useEffect(() {
            store.generateMnemonic();
          }, []);

          // ignore: prefer_const_constructors
          return WalletCreatePage('Create wallet');
        }),
    '/import': (BuildContext context) => WalletSetupProvider(
          // ignore: prefer_const_constructors
          builder: (context, store) => WalletImportPage('Import wallet'),
        ),
    '/profile': (BuildContext context) => WalletSetupProvider(
          // ignore: prefer_const_constructors
          builder: (context, store) => ProfileScreen(),
        ),
    '/transfer': (BuildContext context) => WalletTransferProvider(
          // ignore: prefer_const_constructors
          builder: (context, store) => WalletTransferPage(title: 'Send Tokens'),
        ),
    '/qrcode_reader': (BuildContext context) => QRCodeReaderPage(
          title: 'Scan QRCode',
          onScanned: ModalRoute.of(context)?.settings.arguments as OnScanned?,
        )
  };
}
