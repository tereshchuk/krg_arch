import 'dart:math' as math;
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String? name, typeOfTransaction, date;
  final double? transactionWorth;
  final bool? isTransfer;

  const TransactionCard(
      {this.name,
      this.typeOfTransaction,
      this.date,
      this.transactionWorth,
      this.isTransfer});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        // color: Colors.green,
      ),
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: const EdgeInsets.only(top: 3),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _logoContainer(),
            _textContainer(),
            Spacer(),
            _numberContainer(),
          ],
        ),
      ),
    );
  }

  Widget _numberContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 20,
          width: 90,
          decoration: BoxDecoration(
            color: Colors.purple[600],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '${transactionWorth!.toDouble().toString()} KRG',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
        ),
        Text(
          date!,
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _textContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name!,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        Text(
          typeOfTransaction!,
          style: TextStyle(
            color: Colors.black26,
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _logoContainer() {
    return isTransfer! ? isTransferLogoContainer() : _isRefillLogoContainer();
  }

  isTransferLogoContainer() {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 2,
          color: Colors.black26,
        ),
      ),
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20,
            child: Divider(color: Colors.black26, thickness: 2),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: Transform.rotate(
              angle: 180 * math.pi / 180,
              child: Image.asset(
                'images/image/logo.png',
                color: Colors.black26,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _isRefillLogoContainer() {
    return Container(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 2,
          color: Colors.purple[400]!,
        ),
      ),
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              'images/image/logo.png',
              color: Colors.purple[400],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 20,
            child: Divider(color: Colors.purple[400], thickness: 2),
          ),
        ],
      ),
    );
  }
}
