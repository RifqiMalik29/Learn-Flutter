import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  const BaseText(this.text, {super.key});

  // alasan menggunakan final adalah untuk memastikan bahwa nilai dari text tidak akan berubah setelah diinisialisasi
  // kenapa tidak menggunakan const? karena text bersifat dinamis dan bisa berubah (text adalah properti dari BaseText)
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.white, fontSize: 24));
  }
}
