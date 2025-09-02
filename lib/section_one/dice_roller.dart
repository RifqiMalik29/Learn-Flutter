import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_application_1/section_one/base_text.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  // jika menggunakan StatefulWidget kita tidak menggunakan build method
  // melainkan menggunakan createState
  @override
  // State disini adalah hasil returnnya
  // <DiceRoller> adalah untuk menginformasikan flutter jenis state apa yang akan digunakan
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

// alasan DiceRoller dan _DiceRollerState dipisahkan adalah untuk memisahkan logika tampilan (UI) dan logika bisnis (state management)

// susunannya adalah _ - DiceRoller - State
// _ disini punya peran penting yaitu agar flutter menjadikan class ini sebagai private (tidak bisa diimpor oleh file lain)
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'public/assets/images/dice-1.png';

  // void adalah tipe data yang tidak mengembalikan nilai
  void diceHandler() {
    // alasan image tidak berubah meskipun sudah menimpa activeDiceImage disini adalah
    // karena flutter harus re-execute seluruh Widget
    // caranya adalah menggunakan setState
    activeDiceImage = 'public/assets/images/dice-2.png';

    // nextInt digunakan untuk menghasilkan angka acak
    // value 6 disini adalah batas atas dari angka acak yang dihasilkan
    // sedangkan + 1 digunakan untuk menghasilkan angka antara 1-6
    var randomNumber = math.Random().nextInt(6) + 1;

    // setState hanya tersedia di StatefulWidget
    // alasan randomNumber tidak perlu curly bracket adalah karena flutter akan otomatis mendeteksi perubahan pada variabel yang digunakan di dalam setState
    setState(() {
      activeDiceImage = 'public/assets/images/dice-$randomNumber.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Image.asset(activeDiceImage, width: 200, height: 200),
        // spacing bisa juga menggunakan SizedBox untuk keperluan seperti Divider
        // perbedaan SizedBox dan Container adalah Container akan mengambil tinggi dan lebar yang disediakan oleh layar
        // sedangkan SizedBox hanya akan mengambil tinggi dan lebar yang ditentukan dan tidak akan bertambah (membatu)
        // jika konten didalam SizedBox terlalu kecil maka akan otomatis dipotong
        // const SizedBox(height: 100),
        TextButton(
          onPressed: diceHandler,
          style: TextButton.styleFrom(
            // spacing bisa juga menggunakan padding
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: BaseText('Roll Dice'),
        ),
      ],
    );
  }
}
