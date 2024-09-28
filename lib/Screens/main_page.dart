// import 'package:currency_converter_app/Screens/Converter_Screen.dart';
// import 'package:currency_converter_app/Screens/CurrencyList.dart';
// import 'package:flutter/material.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({super.key});

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   final List<Widget> pages = [
//     const ConverterScreen(),
//     CurrencyList(onCurrencySelected: (String currency) {}),
//     // Placeholder, add your LoginScreen and SignIn when implemented
//   ];
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentPage],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (value) {
//           setState(() {
//             currentPage = value;
//           });
//         },
//         currentIndex: currentPage,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromARGB(255, 15, 171, 255),
//             icon: Icon(Icons.monetization_on, color: Colors.black26),
//             label: "Converter",
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Color.fromARGB(255, 15, 171, 255),
//             icon: Icon(Icons.monetization_on, color: Colors.black26),
//             label: "Currencies",
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:currency_converter_app/Screens/Converter_Screen.dart';
import 'package:currency_converter_app/Screens/CurrencyList.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 0
          ? const ConverterScreen()
          : CurrencyList(onCurrencySelected: (String currency) {
              // Handle currency selection
              print('Selected currency: $currency');
            }),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 15, 171, 255),
            icon: Icon(Icons.monetization_on, color: Colors.black26),
            label: "Converter",
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 15, 171, 255),
            icon: Icon(Icons.list, color: Colors.black26),
            label: "Currencies",
          ),
        ],
      ),
    );
  }
}
