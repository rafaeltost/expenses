import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  const Transactions(
      {Key? key, required this.transactions, required this.onRemove})
      : super(key: key);

  final List<Transaction> transactions;
  final Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'Nenhuma transação cadastrada',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        "assets/images/waiting.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return TransactionItem(transaction: transaction, onRemove: onRemove);
              },
            ),
    );
  }
}
