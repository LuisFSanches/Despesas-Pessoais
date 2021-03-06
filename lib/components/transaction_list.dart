import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';


class TransactionList extends StatelessWidget {
  
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 300,
      child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index){
                final transaction = transactions[index];
                return Card(
                  child: Row(
                    children:<Widget>[
                      Container(
                         margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10
                          ),
                        decoration: BoxDecoration(
                            border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          ),
                          ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'R\$ ' + transaction.value.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            transaction.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('d MMM y').format(transaction.date),
                            style: TextStyle(
                              color: Colors.grey[700]
                            ),
                            )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}