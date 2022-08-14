import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.onRemove,
  }) : super(key: key);

  final Transaction transaction;
  final Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin:
          const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                  'R\$${transaction.value.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle:
            Text(DateFormat('d MMM y').format(transaction.date)),
        trailing: IconButton(
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemove(transaction.id),
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}
