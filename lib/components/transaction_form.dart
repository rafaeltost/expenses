import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:expenses/components/adaptative_text_field.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextField(
                label: 'Titulo',
                onSubmitted: (_) => _submitForm(),
                controller: TransactionForm._titleController,
              ),
              AdaptativeTextField(
                label: 'Titulo',
                onSubmitted: (_) => _submitForm(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: TransactionForm._valueController,
              ),
              AdaptativeDatePicker(
                selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() => _selectedDate = newDate);
                },
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
      ),
    );
  }
}
