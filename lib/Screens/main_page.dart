import 'package:currency_converter_app/Screens/Converter_Screen.dart';
import 'package:currency_converter_app/Screens/CurrencyList.dart';
import 'package:currency_converter_app/Screens/Login_screen.dart';
import 'package:currency_converter_app/Screens/SingIn_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> pages = [
    const ConverterScreen(),
    CurrencyList(),
    const LoginScreen(),
    const SingIn(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 171, 255),
              icon: Icon(
                color: Colors.black26,
                Icons.monetization_on,
              ),
              label: "Converter"),
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 171, 255),
              icon: Icon(
                color: Colors.black26,
                Icons.monetization_on,
              ),
              label: "Currencies"),
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 171, 255),
              icon: Icon(
                color: Colors.black26,
                Icons.monetization_on,
              ),
              label: "History"),
          BottomNavigationBarItem(
              backgroundColor: const Color.fromARGB(255, 15, 171, 255),
              icon: Icon(
                color: Colors.black26,
                Icons.monetization_on,
              ),
              label: "User"),
        ],
      ),
    );
  }
}
