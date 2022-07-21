import 'package:flutter/material.dart';
import 'package:flutter_app_money_tracker/widgets/transaction_widget.dart';

import 'models/transaction_model.dart';
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
    Transaction('ip', 'baterai jam', 21000, DateTime.now()),
    Transaction('ik', 'minum', 21000, DateTime.now()),
    Transaction('iq', 'Hp', 21000, DateTime.now()),
    Transaction('iw', 'charger mac', 21000, DateTime.now()),
    Transaction('ir', 'gojek', 21000, DateTime.now()),
    Transaction('it', 'grab', 21000, DateTime.now()),
    Transaction('i4', 'ovo', 21000, DateTime.now()),
    Transaction('i5', 'dana', 21000, DateTime.now()),
    Transaction('i6', 'logi', 21000, DateTime.now()),
    Transaction('i7', 'tech', 21000, DateTime.now()),
    Transaction('i8', 'club', 21000, DateTime.now()),
    Transaction('i9', 'car', 21000, DateTime.now()),
    Transaction('i1', 'motorcycle', 21000, DateTime.now()),
    Transaction('i2', 'iphone', 21000, DateTime.now()),
    Transaction('i3', 'android', 21000, DateTime.now()),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('scaffold'),
      appBar: AppBar(
        title: const Text('Money Tracker'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              const Card(
                elevation: 15,
                child: MonthlySummary(amount: 20000),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const TextField(
                        decoration: InputDecoration(label: Text('Title'))),
                    const TextField(
                        decoration: InputDecoration(label: Text('Amount'))),
                    TextButton(
                        onPressed: () => {},
                        child: const Text(
                          'Submit',
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ))
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: const Text(
                  "July",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
              Column(
                children:
                    transaction.map((e) => TransactionWidget(e: e)).toList(),
              )
            ],
          ),
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
