import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:  <Widget>[
                   TextField(
                    decoration: const InputDecoration(
                      labelText: 'Titulo'
                    ),
                    controller: titleController,
                    
                  ),
                   TextField(
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)'
                    ),
                   controller: valueController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      TextButton(
                        child: const Text(
                          'Nova Transação',
                          style: TextStyle(
                            color: Colors.purple
                          ),
                          ),
                        onPressed: (){
                          final title = titleController.text;
                          final value = double.tryParse(valueController.text) ?? 0.0;
                          onSubmit(title, value);
                        },
                      ),
                    ],
                  )
                ]
              ),
            ),
          );
  }
}