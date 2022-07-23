import 'package:flutter/material.dart';

import '../models/ders.dart';

class harfNotuHelper{

  static List<String> _tumHarfNotlari=["AA","BB","CC","DD","FF"];

  static List<int> _tumKrediler=[1,2,3,4,5,6,7,8,9,10];

  static List<Ders> tumDersler=[];

  static DersEkle(Ders ders){
    tumDersler.add(ders);
  }

  static OrtalamaHesapla(){
    double toplamNot=0;
    int toplamKredi=0;

    tumDersler.forEach((element) {
    toplamNot=toplamNot+(element.krediDegeri*element.harfDegeri);
    toplamKredi+=element.krediDegeri;
    });

    return toplamNot/toplamKredi;
  }

  static double _harfNotunaCevir(String harf){
    switch(harf){
      case "AA":
        return 4;
      case "BB":
        return 3;
      case "CC":
        return 2;
      case "DD":
        return 1;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> dropdownElemanlari(){
    return _tumHarfNotlari.map((e) => DropdownMenuItem(
      child: Text(e),
      value: _harfNotunaCevir(e),
    )).toList();

}

  static List<DropdownMenuItem<int>> dropdownKrediElemanlari(){
    return _tumKrediler.map((e) => DropdownMenuItem(
      value: e,
      child: Text(e.toString()),
    )).toList();
  }
}