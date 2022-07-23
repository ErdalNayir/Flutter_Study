import 'package:flutter/cupertino.dart';
import 'package:not_hesapla/utils/fonts.dart';

class ShowValues extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;

  const ShowValues ({required this.ortalama,required this.dersSayisi, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dersSayisi>0?"$dersSayisi Ders Girildi":"Ders Seçiniz",
          style: Fontlar.dersSayisiStyle,
        ),
        Text(
          ortalama>=0? "${ortalama.toStringAsFixed(2)}":"0.0",
          style: Fontlar.ortalamaStyle,
        ),
        Text(
          "Ortalamanız",
          style: Fontlar.altYaziOrtalamaStyle,
        )
      ],
    );
  }
}
