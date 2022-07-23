import 'package:flutter/material.dart';
import 'package:not_hesapla/utils/colors.dart';
import 'package:not_hesapla/views/mainpage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Not Hesapla',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Renkler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{'/' : (context)=> const HomePage()}
    );
  }
}
