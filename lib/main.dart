import 'package:flutter/material.dart';
import 'package:flutter_application_1/gradient_container.dart';

// penamaan function menggunakan camelCase, tipe function sama seperti c
// single quote string lebih sering digunakan di dart
// ui flutter dibuat dengan menggabungkan widget
// dart adalah type-safe language
// artinya setiap variabel harus dideklarasikan dengan tipe data yang jelas
void main() {
  // const membantu dart untuk optimasi performa
  // cara kerjanya adalah dengan menghindari pembuatan objek yang sama
  // sehingga dapat mengurangi penggunaan memori
  // dan meningkatkan performa aplikasi
  // dengan cara mendeklarasikan widget yang tidak berubah

  // scaffold digunakan untuk membuat struktur dasar layout
  // penggunaan warna sama seperti jetpack compose / kotlin

  // sebaiknya tidak menggunakan const untuk Container widget
  // karena Container widget seringkali berubah-ubah
  // sehingga dapat mengurangi penggunaan memori

  runApp(
    // MaterialApp disini adalah class yang digunakan untuk membuat aplikasi berbasis material design
    MaterialApp(
      home: Scaffold(
        // backgroundColor: Color(0xFFFFFFFF),
        // ada 2 cara untuk menentukan Color
        backgroundColor: Colors.blue,
        body: GradientContainer(Colors.red, Colors.yellow),
      ),
    ),
  );
}
