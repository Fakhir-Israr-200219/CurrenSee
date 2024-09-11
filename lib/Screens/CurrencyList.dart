import 'package:flutter/material.dart';

class CurrencyList extends StatefulWidget {
  const CurrencyList({super.key});

  @override
  State<CurrencyList> createState() => _CurrencyListState();
}

class _CurrencyListState extends State<CurrencyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Over Currencies"),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "US Doller",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "INR",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "PKR",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "TAKKA",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "ERU",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "YARN",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "RYAL",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "Passo",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "Dirham",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(16),
              color: Colors.blue.shade100,
              height: 200,
              child: Text(
                "Robal",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
