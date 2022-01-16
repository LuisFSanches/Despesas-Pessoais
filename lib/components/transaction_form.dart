import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm(){
      final title = titleController.text;
      final value = double.tryParse(valueController.text) ?? 0.0;
      if(title.isEmpty || value<=0){
        return;
      }
      widget.onSubmit(title, value);            
  }

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
                    onSubmitted: (value)=>_submitForm(),
                  ),
                   TextField(
                    decoration: const InputDecoration(
                      labelText: 'Valor (R\$)'
                    ),
                   controller: valueController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (value)=>_submitForm(),
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
                        onPressed: _submitForm,
                      ),
                    ],
                  )
                ]
              ),
            ),
          );
  }
}