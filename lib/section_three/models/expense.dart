import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

// enum adalah tipe data yang digunakan untuk mendefinisikan sekumpulan nilai konstan
// gunanya untuk membuat suatu tipe / kategory yang akan di input oleh user
// simpelnya adalah membuat tipe data baru
enum ExpenseCategory { food, travel, leisure, work }

const categoryIcons = {
  ExpenseCategory.food: Icons.fastfood,
  ExpenseCategory.travel: Icons.airplanemode_active,
  ExpenseCategory.leisure: Icons.movie,
  ExpenseCategory.work: Icons.work,
};

class Expense {
  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final ExpenseCategory category;

  final formatter = DateFormat.yMd();

  String get formattedDate {
    return formatter.format(date);
  }

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    String? id,
  }) : id = id ?? uuid.v4();
  // list ini artinya menggunakan initializer lists
  // yang berguna untuk menginisialisasi field dengan nilai yang diberikan
  // jadi Expense akan membuat id baru jika tidak ada id yang diberikan
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  // ini adalah constructor function
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final ExpenseCategory category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
