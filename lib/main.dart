import 'package:flutter/material.dart';
import 'package:flutter_app_money_tracker/utils/constants.dart' as constants;
import 'package:flutter_app_money_tracker/widgets/forms_add_transaction.dart';
import 'package:flutter_app_money_tracker/widgets/monthly_summary.dart';
import 'package:flutter_app_money_tracker/widgets/transaction_widget.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: const Key('scaffold'),
        appBar: AppBar(
          title: const Text(
            'Money Tracker',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: GestureDetector(
          onTap: () {
            _dismissKeyboard(context);
          },
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
            child: Column(
              children: <Widget>[
                const MonthlySummary(amount: 20000),
                const FormsAddTransaction(),
                Column(
                  children: constants.TRANSACTION
                      .map((e) => TransactionWidget(e: e))
                      .toList(),
                ),
              ],
            ),
          ),
        ));
  }
}
