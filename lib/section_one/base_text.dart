import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BaseText extends StatelessWidget {
  // cara membuat this.fontSize opsional adalah dengan cara menambahkan tanda tanya (?) pada tipe datanya
  const BaseText(this.text, {this.fontSize, this.fontColor, this.fontWeight, super.key});

  // alasan menggunakan final adalah untuk memastikan bahwa nilai dari text tidak akan berubah setelah diinisialisasi
  // kenapa tidak menggunakan const? karena text bersifat dinamis dan bisa berubah (text adalah properti dari BaseText)
  final String text;
  final double? fontSize;
  final Color? fontColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: fontColor ?? Colors.black,
        fontSize: fontSize ?? 24,
        fontFamily: GoogleFonts.lato().fontFamily,
        fontWeight: fontWeight
      ),
    );
  }
}
