import 'package:currency_converter_app/Screens/Converter_Screen.dart';
import 'package:currency_converter_app/Screens/Login_screen.dart';
import 'package:currency_converter_app/Screens/SingIn_screen.dart';
import 'package:currency_converter_app/Screens/main_page.dart';
import 'package:flutter/material.dart';

import 'Screens/CurrencyList.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter currency app",
      home: MainPage(),

      // bcz we use buttom navigation here
      // initialRoute: 'ConverterPage',
      // routes: {
      //   'login': (context) => LoginScreen(),
      //   'singIn': (context) => SingIn(),
      //   'currencyList': (context) => CurrencyList(),
      //   'ConverterPage': (context) => ConverterScreen(),
      // },
    ),
  );
}
