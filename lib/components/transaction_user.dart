import 'package:flutter/material.dart';
import 'dart:math';
import 'transaction_form.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {

  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value:310.76,
      date:DateTime.now(),
    ),

    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value:211.30,
      date:DateTime.now(),
    ),
      Transaction(
      id: 't3',
      title: 'Conta de Água',
      value:211.30,
      date:DateTime.now(),
    ),
      Transaction(
      id: 't4',
      title: 'Conta de Telefone',
      value:211.30,
      date:DateTime.now(),
    ),
      Transaction(
      id: 't5',
      title: 'Conta de Internet',
      value:211.30,
      date:DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Restaurante',
      value:211.30,
      date:DateTime.now(),
    ),
   
  ];

  _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value:value,
      date: DateTime.now(),
    );
    
    setState(() {
      transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions),
        TransactionForm(_addTransaction)
      ],
    );
  }
}