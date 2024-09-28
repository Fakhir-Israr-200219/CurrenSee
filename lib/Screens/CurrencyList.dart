// import 'package:flutter/material.dart';

// class CurrencyList extends StatefulWidget {
//   const CurrencyList({super.key});

//   @override
//   State<CurrencyList> createState() => _CurrencyListState();
// }

// class _CurrencyListState extends State<CurrencyList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("All Over Currencies"),
//       ),
//       body: Container(
//         child: ListView(
//           children: [
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "US Doller",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "INR",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "PKR",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "TAKKA",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "ERU",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "YARN",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "RYAL",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "Passo",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "Dirham",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//             Container(
//               alignment: Alignment.center,
//               margin: EdgeInsets.all(16),
//               color: Colors.blue.shade100,
//               height: 200,
//               child: Text(
//                 "Robal",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CurrencyList extends StatefulWidget {
  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Over Currencies"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            _buildCurrencyContainer("US Dollar"),
            _buildCurrencyContainer("INR"),
            _buildCurrencyContainer("PKR"),
            _buildCurrencyContainer("TAKKA"),
            _buildCurrencyContainer("EUR"),
            _buildCurrencyContainer("YEN"),
            _buildCurrencyContainer("RYAL"),
            _buildCurrencyContainer("Peso"),
            _buildCurrencyContainer("Dirham"),
            _buildCurrencyContainer("Ruble"),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyContainer(String currency) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Subtle shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Changes position of shadow
          ),
        ],
      ),
      height: 150, // Reduced height for a more compact look
      child: Text(
        currency,
        style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade900),
      ),
    );
  }
}
