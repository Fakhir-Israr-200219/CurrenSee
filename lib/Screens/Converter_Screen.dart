import 'package:flutter/material.dart';
import 'package:currency_converter_app/Screens/CurrencyList.dart';

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

  // Conversion rates as a nested map
  final Map<String, Map<String, double>> conversionRates = {
    "USD": {
      "INR": 75.0,
      "PKR": 250.0,
      "TAKKA": 80.0,
      "EUR": 0.85,
      "YEN": 110.0,
      "RYAL": 3.75,
      "Peso": 20.0,
      "Dirham": 3.67,
      "Ruble": 74.0
    },
    "INR": {
      "USD": 0.013,
      "PKR": 3.5,
      "TAKKA": 1.06,
      "EUR": 0.011,
      "YEN": 1.47,
      "RYAL": 0.05,
      "Peso": 0.27,
      "Dirham": 0.049,
      "Ruble": 0.98
    },
    "PKR": {
      "USD": 0.004,
      "INR": 0.29,
      "TAKKA": 0.30,
      "EUR": 0.0034,
      "YEN": 0.58,
      "RYAL": 0.015,
      "Peso": 0.12,
      "Dirham": 0.014,
      "Ruble": 0.26
    },
    // Add other currency conversions here
  };

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
        conversionRates[selectedFromCurrency]!
            .containsKey(selectedToCurrency)) {
      conversionRate =
          conversionRates[selectedFromCurrency]![selectedToCurrency]!;
    } else {
      conversionRate = 1.0; // Default to 1.0 if no rate is found
    }

    double convertedAmount = amount * conversionRate;
    _convertedAmountController.text = convertedAmount.toStringAsFixed(2);
  }
}
