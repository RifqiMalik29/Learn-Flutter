import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';
// GradientContainer adalah nama dari sebuah class
// extends adalah keyword yang digunakan untuk mewarisi class
// StatelessWidget adalah class yang digunakan untuk membuat widget yang tidak memiliki state

// nilai var dapat diubah
// tidak perlu menambahkan tipe data karena dart otomatis mengambil tipe dari nilai value
var startAlignment = Alignment.topLeft;
var endAlignment = Alignment.bottomRight;

// cara membuat variabel dengan tipe data tertentu
String name = "Rifqi";
// cara membuat variabel placeholder yang bisa null
int? age;
// jika value adalah nilai tetap dan tidak akan berubah
// bisa juga menggunakan const
// perbedaan const dan final adalah
// const adalah compile-time constant, sedangkan final adalah run-time constant

// final menetapkan nilai sekali saja (tidak dapat diubah setelah diinisialisasi) pada saat runtime, artinya nilai bisa ditetapkan berdasarkan input atau kondisi yang baru diketahui saat program berjalan.
// const memerlukan nilai yang diketahui dan ditetapkan pada saat kompilasi, sehingga nilai tersebut sudah ada sebelum program dijalankan dan harus bersifat eksplisit atau konstan.
final String email = "rifqi@example.com";

// saat membuat UI yang berubah sesuai kondisi / variabel maka jangan gunakan StatelessWidget
// tapi gunakan StatefulWidget
class GradientContainer extends StatelessWidget {
  // super adalah keyword yang digunakan untuk memanggil constructor dari class induk
  const GradientContainer(this.startColor, this.endColor, {super.key});

  // ini adalah cara untuk membuat constructor dengan parameter default
  // kelebihannya tidak perlu menentukan warna lagi, hanya perlu memanggil constructor ini
  const GradientContainer.redYellow({super.key})
    : startColor = Colors.red,
      endColor = Colors.yellow;

  final Color startColor;
  final Color endColor;

  // override digunakan untuk mengubah implementasi dari method yang diwarisi
  @override
  // ctx adalah context
  // tiap membuat widget baru akan selalu menambahkan context karena
  // context digunakan untuk mengakses informasi tentang widget
  Widget build(ctx) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [startColor, endColor],
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      // child: Center(child: BaseText(name)),
      // cara memanggil gambar menggunakan asset yang sudah ada
      child: Center(
        // Column disini digunakan untuk menampung beberapa widget secara vertikal sedangkan Row digunakan untuk menampung beberapa widget secara horizontal
        // Cara kerjanya sama seperti flex
        child: DiceRoller(),
      ),
    );
  }
}
