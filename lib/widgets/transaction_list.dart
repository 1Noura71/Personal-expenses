import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet!!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                    height: 300,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      semanticLabel: 'No transaction',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${transaction[index].amount}')),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () => deleteTx(transaction[index].id),
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
