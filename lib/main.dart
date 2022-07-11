import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'utils/currency_format.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Transaction> transaction = <Transaction>[
    Transaction('id', 'makan', 20000, DateTime.now()),
    Transaction('if', 'pulsa', 21000, DateTime.now()),
    Transaction('ik', 'minum', 21000, DateTime.now()),
    Transaction('ip', 'baterai jam', 21000, DateTime.now()),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold'),
      appBar: AppBar(
        title: const Text('Money Tracker'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            const Card(
              elevation: 15,
              child: MonthlySummary(amount: 20000),
            ),
            Column(
              children: transaction
                  .map((e) => Container(
                        height: 100,
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
                        key: Key(e.id),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Card(
                          elevation: 3,
                            key: Key(e.id),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: Text(
                                    e.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 0, 30, 0),
                                  child: Text(
                                    CurrencyFormat.convertToIdr(e.amount, 0),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ))
                  .toList(),
            )
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
