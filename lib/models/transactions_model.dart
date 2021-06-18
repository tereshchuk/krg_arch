class Transaction {
  final String? name, typeOfTransaction, date;
  final double? transactionWorth;
  final bool? isTransfer;

  Transaction({
    this.name,
    this.typeOfTransaction,
    this.date,
    this.transactionWorth,
    this.isTransfer,
  });
}

final List<Transaction> transactions = [
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Refill",
    date: "03/24/2021",
    transactionWorth: 4.82,
    isTransfer: false,
  ),
  Transaction(
    name: "Mr. Gretsch",
    typeOfTransaction: "Transfer",
    date: "01/07/2021",
    transactionWorth: 0.47,
    isTransfer: true,
  ),
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Refill",
    date: "03/24/2021",
    transactionWorth: 1200.82,
    isTransfer: false,
  ),
  Transaction(
    name: "Lostless 1092",
    typeOfTransaction: "Transfer",
    date: "01/07/2021",
    transactionWorth: 0.1,
    isTransfer: true,
  ),
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Transfer",
    date: "03/24/2021",
    transactionWorth: 3,
    isTransfer: true,
  ),
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Transfer",
    date: "03/24/2021",
    transactionWorth: 8,
    isTransfer: true,
  ),

  //
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Refill",
    date: "03/24/2021",
    transactionWorth: 4.82,
    isTransfer: false,
  ),
  Transaction(
    name: "Mr. Gretsch",
    typeOfTransaction: "Transfer",
    date: "01/07/2021",
    transactionWorth: 0.47,
    isTransfer: true,
  ),
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Refill",
    date: "03/24/2021",
    transactionWorth: 1200.82,
    isTransfer: false,
  ),
  Transaction(
    name: "Lostless 1092",
    typeOfTransaction: "Transfer",
    date: "01/07/2021",
    transactionWorth: 0.1,
    isTransfer: true,
  ),
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Transfer",
    date: "03/24/2021",
    transactionWorth: 3,
    isTransfer: true,
  ),
  Transaction(
    name: "Private wallet",
    typeOfTransaction: "Transfer",
    date: "03/24/2021",
    transactionWorth: 8,
    isTransfer: true,
  ),
];
