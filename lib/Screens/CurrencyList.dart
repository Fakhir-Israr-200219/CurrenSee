// import 'package:flutter/material.dart';

// class Currency {
//   final String name;
//   final double rate; // Add a rate property

//   Currency(this.name, this.rate);
// }

// class CurrencyList extends StatelessWidget {
//   final Function(String) onCurrencySelected;

//   CurrencyList({required this.onCurrencySelected, Key? key}) : super(key: key);

//   final List<Currency> _currencies = [
//     Currency("US Dollar", 1.0), // Base currency
//     Currency("INR", 75.0),
//     Currency("PKR", 250.0),
//     Currency("TAKKA", 87.0),
//     Currency("EUR", 0.85),
//     Currency("YEN", 110.0),
//     Currency("RYAL", 3.75),
//     Currency("Peso", 20.0),
//     Currency("Dirham", 3.67),
//     Currency("Ruble", 70.0),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("All Currencies"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: ListView(
//           children: _currencies
//               .map((currency) => _buildCurrencyContainer(currency, context))
//               .toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildCurrencyContainer(Currency currency, BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onCurrencySelected(currency.name);
//         Navigator.pop(context); // Close modal after selecting
//       },
//       child: Container(
//         alignment: Alignment.center,
//         margin: EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.blue.shade100,
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         height: 100,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               currency.name,
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade900),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(right: 16.0),
//               child: Text(
//                 "\$ ${currency.rate}", // Show the rate
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade900,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Currency {
  final String name;
  final double rate;

  Currency(this.name, this.rate);
}

class CurrencyList extends StatelessWidget {
  final Function(String) onCurrencySelected;

  CurrencyList({required this.onCurrencySelected, Key? key}) : super(key: key);

  final List<Currency> _currencies = [
    Currency("US Dollar", 1.0),
    Currency("INR", 75.0),
    Currency("PKR", 250.0),
    Currency("TAKKA", 87.0),
    Currency("EUR", 0.85),
    Currency("YEN", 110.0),
    Currency("RYAL", 3.75),
    Currency("Peso", 20.0),
    Currency("Dirham", 3.67),
    Currency("Ruble", 70.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Currencies"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: _currencies
              .map((currency) => _buildCurrencyContainer(currency, context))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCurrencyContainer(Currency currency, BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCurrencySelected(currency.name);
        Navigator.pop(context); // Close modal after selecting
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Currency icon (you can replace with actual icons)
                  Icon(Icons.monetization_on, color: Colors.blue),
                  SizedBox(width: 10),
                  Text(
                    currency.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ],
              ),
              Text(
                "\$ ${currency.rate.toStringAsFixed(2)}", // Show the rate
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
