import 'package:flutter/material.dart';
import 'package:not_hesapla/helper/harf_notu_helper.dart';
import 'package:not_hesapla/utils/colors.dart';
import 'package:not_hesapla/utils/fonts.dart';

class DersList extends StatelessWidget {
  final Function onDismiss;
  const DersList({required this.onDismiss,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return harfNotuHelper.tumDersler.length>0? ListView.builder(
      itemCount: harfNotuHelper.tumDersler.length,
      itemBuilder: (BuildContext context, int index){
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.startToEnd,
          onDismissed: (value){
            onDismiss(index);
          },
          child: Card(
            child: ListTile(
            title: Text(harfNotuHelper.tumDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Renkler.anaRenk.shade100,
                child: Text((harfNotuHelper.tumDersler[index].krediDegeri*harfNotuHelper.tumDersler[index].harfDegeri).toStringAsFixed(2)),
                maxRadius: 22,
              ),
                subtitle: Text("Kredi Değeri: ${harfNotuHelper.tumDersler[index].krediDegeri} Not Değeri: ${harfNotuHelper.tumDersler[index].harfDegeri}"),
            ),
          ),
        );
      },

    ): Center(
      child: Container(
        child: Text("Lütfen Ders Ekleyin",
          style: Fontlar.ortalamaStyle
          ),
      ),
    );
  }
}
