import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_three/models/expense.dart';
import 'package:flutter_application_1/section_three/widgets/chart/chart.dart';
import 'package:flutter_application_1/section_three/widgets/expenses/new_expense.dart';
import 'package:flutter_application_1/section_three/widgets/expenses/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Food',
      amount: 50.0,
      date: DateTime.now(),
      category: ExpenseCategory.food,
    ),
    Expense(
      title: 'Travel',
      amount: 100.0,
      date: DateTime.now(),
      category: ExpenseCategory.travel,
    ),
    Expense(
      title: 'Work',
      amount: 200.0,
      date: DateTime.now(),
      category: ExpenseCategory.work,
    ),
  ];

  void _closeAddExpenseOverlay() {
    Navigator.of(context).pop();
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _deleteExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    ScaffoldMessenger.of(context).clearSnackBars();

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Expense deleted'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => NewExpense(
        onCloseBottomSheet: _closeAddExpenseOverlay,
        onAddExpense: _addExpense,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onDeleteExpense: _deleteExpense,
      );
    }
    return Scaffold(
      // appBar disini seperti Header
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: _openAddExpenseOverlay,
            ),
          ),
        ],
      ),
      body: width < 600 ? Column(
        children: [
          const Text('Expenses Screen'),
          // Expanded digunakan untuk solusi bug dari flutter yang tidak bisa menampilkan list didalam Column
          // karena pada dasarnya Column tidak memiliki ukuran yang pasti
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent),
        ],
      ) : Row(
        children: [
          Expanded(child: Chart(expenses: _registeredExpenses)),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
