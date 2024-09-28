import 'package:flutter/material.dart';
import 'package:currency_converter_app/Screens/CurrencyList.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  String selectedFromCurrency = "USD";
  String selectedToCurrency = "INR";
  double conversionRate = 1.0; // Default conversion rate

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _convertedAmountController =
      TextEditingController();

  // Conversion rates as a map
  Map<String, double> conversionRates = {};

  @override
  void initState() {
    super.initState();
    _loadCurrencyData(); // Load currency data on initialization
  }

  Future<void> _loadCurrencyData() async {
    // Load the JSON data
    final String response =
        await rootBundle.loadString('assets/currencies.json');
    final List<dynamic> data = json.decode(response);

    // Convert the data into a map
    for (var currency in data) {
      String name = currency['name'];
      double rate = currency['rate'];
      conversionRates[name] = rate;
    }

    // Ensure default currencies are set if they exist in the data
    if (conversionRates.containsKey(selectedFromCurrency) &&
        conversionRates.containsKey(selectedToCurrency)) {
      _updateConvertedAmount(); // Update the conversion amount
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Converter"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400.0,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.purple.shade100,
              ),
              child: Center(
                child: Text(
                  "\$ ${_convertedAmountController.text.isEmpty ? '0' : _convertedAmountController.text}",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Enter amount",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _updateConvertedAmount();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    _showCurrencySelector(true);
                  },
                  child: Text(selectedFromCurrency),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Colors.transparent), // Remove button border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _convertedAmountController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Converted amount",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    _showCurrencySelector(false);
                  },
                  child: Text(selectedToCurrency),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Colors.transparent), // Remove button border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showCurrencySelector(bool isFromCurrency) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CurrencyList(
          onCurrencySelected: (currency) {
            setState(() {
              if (isFromCurrency) {
                selectedFromCurrency = currency;
              } else {
                selectedToCurrency = currency;
              }
              _updateConvertedAmount();
            });
          },
        );
      },
    );
  }

  void _updateConvertedAmount() {
    double amount = double.tryParse(_amountController.text) ?? 0;

    // Get the conversion rate from the selected currencies
    if (conversionRates.containsKey(selectedFromCurrency) &&
        conversionRates.containsKey(selectedToCurrency)) {
      double fromRate = conversionRates[selectedFromCurrency]!;
      double toRate = conversionRates[selectedToCurrency]!;

      conversionRate = toRate / fromRate; // Update the conversion rate
    } else {
      conversionRate = 1.0; // Default to 1.0 if no rate is found
    }

    double convertedAmount = amount * conversionRate;
    _convertedAmountController.text = convertedAmount.toStringAsFixed(2);
  }
}
