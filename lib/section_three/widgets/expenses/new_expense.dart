import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_three/models/expense.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onCloseBottomSheet, required this.onAddExpense});

  final void Function() onCloseBottomSheet;
  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // objek yang bisa digunakan untuk mengontrol input
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  ExpenseCategory selectedCategory = ExpenseCategory.food;
  // saat menggunakan controller penting untuk membersihkan input setelah digunakan
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _cancelData() {
    _titleController.clear();
    _amountController.clear();
    setState(() {
      selectedCategory = ExpenseCategory.food;
    });

    // closeModal
    widget.onCloseBottomSheet();
  }

  void _submitData() {
    final isTitleEmpty = _titleController.text.trim().isEmpty;
    final enteredAmount = double.tryParse(_amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;
    final isDateInvalid = selectedDate == null;

    if (isTitleEmpty ||
        isAmountInvalid ||
        isDateInvalid) {
      // show error dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: selectedDate!,
        category: selectedCategory,
      ),
    );
    widget.onCloseBottomSheet();
  }

  void onPressDateIcon() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = DateTime(now.year + 1, now.month, now.day);

    // kenapa menggunakan promise? jika dilihat di fucntion showDatePicker
    // tertulis menggunakan tipe data Future
    // yang artinya function bisa langsung dipanggil tapi value-nya tidak
    final datePicker = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    setState(() {
      selectedDate = datePicker;
    });
  }

  void onChangeDropdown(ExpenseCategory? value) {
    if (value != null) {
      setState(() {
        selectedCategory = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _amountController,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate != null
                          ? DateFormat.yMd().format(selectedDate!)
                          : 'No Date Selected',
                    ),
                    IconButton(
                      onPressed: onPressDateIcon,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                items: ExpenseCategory.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  onChangeDropdown(value);
                },
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: _cancelData, child: Text('Cancel')),
                    ElevatedButton(
                      onPressed: _submitData,
                      child: Text('Add Expense'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
