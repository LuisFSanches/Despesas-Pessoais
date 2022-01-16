import 'models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
           
            child: const Card(
              child:Text('Gráfico'),
            ),
          ),
          Column(
            children: transactions.map((transaction){
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
            }).toList()
          ),
          Card(
            elevation: 5,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  <Widget>[
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Titulo'
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const TextButton(
                        child: Text('Nova Transação'),
                        onPressed: null,
                      ),
                    ],
                  )
                ]
              ),
            ),
          )
        ],
      )
    );
  }
}