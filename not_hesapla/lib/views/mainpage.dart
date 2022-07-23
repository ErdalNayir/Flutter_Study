import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:not_hesapla/helper/harf_notu_helper.dart';
import 'package:not_hesapla/models/ders.dart';
import 'package:not_hesapla/utils/fonts.dart';
import 'package:not_hesapla/utils/colors.dart';
import 'package:not_hesapla/widgets/harfNotuDropdown.dart';
import 'package:not_hesapla/widgets/showValues.dart';

import '../widgets/ListCard.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final formKey= GlobalKey<FormState>();
  double secilenDeger=4;
  int krediInitialValue=1;
  String girilenDersAdi='';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:  Center(child:Text("Merhaba",style: Fontlar.baslikStyle,)),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Expanded(
                  flex: 2,
                  child: Container(
                      child:  _buildForm(),

                  ),


              ),
              Expanded(
                flex: 1,
                child: ShowValues(ortalama: harfNotuHelper.OrtalamaHesapla(),dersSayisi: harfNotuHelper.tumDersler.length,)

        ),
            ],
          ),
          Expanded(
            child:DersList(onDismiss: (index){
              harfNotuHelper.tumDersler.removeAt(index);
              setState(() {

              });

            },)
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),child:  HarfNotuDropdown(onBasildi: (harf){
                secilenDeger=harf!;
              },))),
              Expanded(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),child:  _buildKrediDropdown())),
              IconButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                  var ders = Ders(ad: girilenDersAdi, harfDegeri: secilenDeger, krediDegeri: krediInitialValue);

                  print(ders);
                  harfNotuHelper.DersEkle(ders);
                  print(harfNotuHelper.tumDersler);
                  setState(() {

                  });
                }
              },
                  icon: Icon(Icons.arrow_forward_ios_sharp,color: Renkler.anaRenk,size: 30,)),
            ],
          )
        ],
      ),);
  }

  _buildTextFormField() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 6),
      child: TextFormField(
        onSaved: (deger){
          setState(() {
            girilenDersAdi=deger!;
          });
        },
        validator: (deger){
          if(deger!.isEmpty){
              return "Lütfen bir ders adı giriniz";
          }else{
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: "Not",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24.0),borderSide: BorderSide.none),
          filled: true,
          fillColor: Renkler.anaRenk.shade100.withOpacity(0.5)

        ),


      ),
    );
  }



  _buildKrediDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: BoxDecoration(
        color: Renkler.anaRenk.shade100.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),

      ),
      child: DropdownButton<int>(
        value: krediInitialValue,
        elevation: 16,
        iconEnabledColor: Renkler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
            krediInitialValue=deger!;
          });
        },
        items: harfNotuHelper.dropdownKrediElemanlari(),
        underline: Container(),
      ),
    );
  }



}
