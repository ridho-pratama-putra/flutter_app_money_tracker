import 'package:flutter/material.dart';

import 'CurrencyFormat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold'),
      appBar: AppBar(
        title: const Text('Money Tracker'),
      ),
      body: Container(
        child: Column(
          children: const <Widget>[
            Card(
              elevation: 15,
              child: MonthlySummary(amount: 20000),
            ),
          ],
        ),
      ),
    );
  }
}

class MonthlySummary extends StatelessWidget {
  final int amount;

  const MonthlySummary({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.01, 0.5, 0.6, 0.9],
          colors: [
            Colors.purple.shade200,
            Colors.purple.shade700,
            Colors.purple.shade600,
            Colors.purple.shade400,
          ],
        ),
      ),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Total Spended',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Text(
            CurrencyFormat.convertToIdr(amount, 0),
            style: const TextStyle(fontSize: 34, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
