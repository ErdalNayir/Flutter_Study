import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not_hesapla/utils/colors.dart';

class Fontlar{
  static final TextStyle baslikStyle= GoogleFonts.quicksand(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Renkler.anaRenk

  );

  static final TextStyle dersSayisiStyle= GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Renkler.anaRenk.shade400

  );

  static final TextStyle ortalamaStyle= GoogleFonts.quicksand(
      fontSize: 55,
      fontWeight: FontWeight.w900,
      color: Renkler.anaRenk.shade400

  );

  static final TextStyle altYaziOrtalamaStyle= GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Renkler.anaRenk.shade400

  );
}