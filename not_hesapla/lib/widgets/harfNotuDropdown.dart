import 'package:flutter/material.dart';
import 'package:not_hesapla/helper/harf_notu_helper.dart';
import 'package:not_hesapla/utils/colors.dart';

class HarfNotuDropdown extends StatefulWidget {
  final Function onBasildi;
  const HarfNotuDropdown({required this.onBasildi,Key? key}) : super(key: key);

  @override
  _HarfNotuDropdownState createState() => _HarfNotuDropdownState();
}

class _HarfNotuDropdownState extends State<HarfNotuDropdown> {
  double secilenDeger=4;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Renkler.anaRenk.shade100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),

      ),
      child: DropdownButton<double>(
        value: secilenDeger,
        elevation: 16,
        iconEnabledColor: Renkler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenDeger=deger!;
            widget.onBasildi(secilenDeger);
          });
        },
        items: harfNotuHelper.dropdownElemanlari(),
        underline: Container(),
      ),
    );
  }
}
