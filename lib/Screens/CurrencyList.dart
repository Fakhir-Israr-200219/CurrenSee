// import 'package:flutter/material.dart';

// class Currency {
//   final String name;
//   final double rate;

//   Currency(this.name, this.rate);
// }

// class CurrencyList extends StatefulWidget {
//   final Function(String) onCurrencySelected;

//   CurrencyList({required this.onCurrencySelected, Key? key}) : super(key: key);

//   @override
//   _CurrencyListState createState() => _CurrencyListState();
// }

// class _CurrencyListState extends State<CurrencyList> {
//   final List<Currency> _currencies = [
//     Currency("US Dollar", 1.0),
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

//   double selectedCurrencyRate = 1.0; // Default to US Dollar rate
//   String? selectedCurrencyName; // Track the name of the selected currency

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
//               .map((currency) => _buildCurrencyContainer(currency))
//               .toList(),
//         ),
//       ),
//     );
//   }

//   Widget _buildCurrencyContainer(Currency currency) {
//     bool isSelected = currency.name ==
//         selectedCurrencyName; // Check if this currency is selected

//     return GestureDetector(
//       onTap: () {
//         // Update the selected currency rate and name when tapped
//         setState(() {
//           selectedCurrencyRate = currency.rate;
//           selectedCurrencyName = currency.name; // Set selected currency name
//         });
//         widget.onCurrencySelected(currency.name); // Call the provided function
//       },
//       child: Card(
//         margin: EdgeInsets.symmetric(vertical: 8),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         elevation: 4,
//         color: isSelected
//             ? Colors.blue.shade100
//             : Colors.white, // Change color if selected
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Icon(Icons.monetization_on, color: Colors.blue),
//                   SizedBox(width: 10),
//                   Text(
//                     currency.name,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue.shade900,
//                     ),
//                   ),
//                 ],
//               ),
//               // Calculate the converted rate based on selected currency
//               Text(
//                 "\$ ${(currency.rate / selectedCurrencyRate).toStringAsFixed(2)}", // Show the converted rate
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue.shade900,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// perfect  


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for rootBundle

class Currency {
  final String name;
  final double rate;

  Currency(this.name, this.rate);

  // Create a factory constructor to create Currency from JSON
  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      json['name'] as String,
      (json['rate'] as num).toDouble(),
    );
  }
}

class CurrencyList extends StatefulWidget {
  final Function(String) onCurrencySelected;

  CurrencyList({required this.onCurrencySelected, Key? key}) : super(key: key);

  @override
  _CurrencyListState createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  List<Currency> _currencies = []; // Initialize an empty list
  double selectedCurrencyRate = 1.0; // Default to US Dollar rate
  String? selectedCurrencyName; // Track the name of the selected currency

  @override
  void initState() {
    super.initState();
    _loadCurrencies(); // Load currencies when the widget is initialized
  }

  Future<void> _loadCurrencies() async {
    // Load the JSON file from assets
    final String response = await rootBundle.loadString('assets/currencies.json');
    final List<dynamic> data = json.decode(response);

    // Convert JSON data to Currency objects
    setState(() {
      _currencies = data.map((currencyJson) => Currency.fromJson(currencyJson)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Currencies"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _currencies.isEmpty // Check if currencies are loaded
            ? Center(child: CircularProgressIndicator()) // Show a loading indicator
            : ListView(
                children: _currencies
                    .map((currency) => _buildCurrencyContainer(currency))
                    .toList(),
              ),
      ),
    );
  }

  Widget _buildCurrencyContainer(Currency currency) {
    bool isSelected = currency.name == selectedCurrencyName; // Check if this currency is selected

    return GestureDetector(
      onTap: () {
        // Update the selected currency rate and name when tapped
        setState(() {
          selectedCurrencyRate = currency.rate;
          selectedCurrencyName = currency.name; // Set selected currency name
        });
        widget.onCurrencySelected(currency.name); // Call the provided function
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        color: isSelected ? Colors.blue.shade100 : Colors.white, // Change color if selected
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
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
              // Calculate the converted rate based on selected currency
              Text(
                "\$ ${(currency.rate / selectedCurrencyRate).toStringAsFixed(2)}", // Show the converted rate
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
