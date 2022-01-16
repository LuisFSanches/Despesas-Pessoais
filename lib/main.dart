import 'package:expenses/components/transaction_form.dart';
import 'dart:math';
import 'models/transaction.dart';
import 'package:flutter/material.dart';

import './components/transaction_form.dart';
import './components/transaction_list.dart';
import '/models/transaction.dart';


main()=> runApp(ExpensesApp());


class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
      context: context, 
      builder: (_){
        return TransactionForm(_addTransaction);
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: ()=>_openTransactionFormModal(context), 
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: const Card(
                child:Text('Gráfico'),
              ),
            ),
            TransactionList(transactions),
           
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}