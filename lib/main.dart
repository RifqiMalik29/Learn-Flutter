import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/section_three/section_three.dart';

// penamaan function menggunakan camelCase, tipe function sama seperti c
// single quote string lebih sering digunakan di dart
// ui flutter dibuat dengan menggabungkan widget
// dart adalah type-safe language
// artinya setiap variabel harus dideklarasikan dengan tipe data yang jelas
void main() {
  var kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181),
  );
  var kDarkScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181),
    brightness: Brightness.dark,
  );
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

  // ensureInitialized digunakan untuk memastikan bahwa binding
  // antara framework dan engine sudah terhubung sebelum menjalankan aplikasi
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(
      // MaterialApp disini adalah class yang digunakan untuk membuat aplikasi berbasis material design
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kDarkScheme.onPrimaryContainer,
            foregroundColor: kDarkScheme.primaryContainer,
          ),
          cardTheme: CardThemeData().copyWith(
            color: kDarkScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkScheme.primaryContainer,
              foregroundColor: kDarkScheme.onPrimaryContainer,
            ),
          ),
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(
              color: kDarkScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        theme: ThemeData().copyWith(
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          cardTheme: CardThemeData().copyWith(
            color: kColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer,
              foregroundColor: kColorScheme.onPrimaryContainer,
            ),
          ),
          textTheme: TextTheme().copyWith(
            titleLarge: TextStyle(
              color: kColorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        // default theme
        // themeMode: ThemeMode.system,
        home: Scaffold(
          // backgroundColor: Color(0xFFFFFFFF),
          // ada 2 cara untuk menentukan Color
          backgroundColor: Colors.blue,
          body: SectionThree(),
        ),
      ),
    );
  });
}
