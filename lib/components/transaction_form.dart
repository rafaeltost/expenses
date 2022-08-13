import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key, required this.onSubmit}) : super(key: key);

  final Function(String, double, DateTime) onSubmit;

  static final _titleController = TextEditingController();
  static final _valueController = TextEditingController();

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {

  DateTime _selectedDate = DateTime.now();

  void _submitForm() {
    final title = TransactionForm._titleController.text;
    final value = double.parse(TransactionForm._valueController.text);
    final date = _selectedDate;

    if (title.isEmpty || value <= 0) return;

    widget.onSubmit(title, value, date);
  }

  

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (_) => _submitForm,
              controller: TransactionForm._titleController,
              decoration: const InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              onSubmitted: (_) => _submitForm,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: TransactionForm._valueController,
              decoration: const InputDecoration(labelText: "Valor R\$"),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'Data selecionada: ${DateFormat('dd/MM/y').format(_selectedDate)}',
                  ),
                ),
                TextButton(
                  onPressed: _showDatePicker,
                  child: const Text(
                    'Selecionar data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Nova Transação'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
