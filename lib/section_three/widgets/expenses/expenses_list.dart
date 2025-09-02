import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_three/models/expense.dart';
import 'package:flutter_application_1/section_three/widgets/expenses/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDeleteExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    // kenapa kita menggunakan ListView dibandingkan Column?
    // karena ListView dapat menggulirkan konten yang lebih besar dari layar
    // sedangkan Column tidak dapat menggulirkan konten

    // alasan kedua adalah jika kita tidak tau berapa banyak item yang akan ditampilkan
    // kita bisa menggunakan ListView.builder untuk membuat item secara dinamis
    return ListView.builder(
      // itemCount adalah jumlah item yang akan ditampilkan
      itemCount: expenses.length,
      // itemBuilder adalah fungsi yang akan dipanggil untuk membangun setiap item
      itemBuilder: (context, index) => Dismissible(
        // Dismissible digunakan untuk menghapus item dari daftar menggunakan swipe
        key: ValueKey(expenses[index]),
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: EdgeInsets.symmetric(
            horizontal: Theme.of(context).cardTheme.margin!.horizontal,
          ),
        ),
        onDismissed: (direction) {
          onDeleteExpense(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index]),
      ),
    );
  }
}
