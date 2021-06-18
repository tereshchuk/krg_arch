import 'package:krg_app/cards/transaction_card.dart';
import 'package:krg_app/models/transactions_model.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Transaction> _transactions = transactions;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _transactions.length,
        itemBuilder: (BuildContext context, int index) {
          return TransactionCard(
            name: _transactions[index].name,
            typeOfTransaction: _transactions[index].typeOfTransaction,
            date: _transactions[index].date,
            transactionWorth: _transactions[index].transactionWorth,
            isTransfer: _transactions[index].isTransfer,
          );
        },
      ),
    );
  }
}
