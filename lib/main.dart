import 'models/transaction.dart';
import 'package:flutter/material.dart';
import 'components/transaction_user.dart';


main()=> runApp(ExpensesApp());


class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
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
            TransactionUser()
          ],
        ),
      )
    );
  }
}