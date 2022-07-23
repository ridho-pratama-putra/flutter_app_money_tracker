import 'package:flutter/material.dart';
import 'package:flutter_app_money_tracker/utils/currency_format.dart';

class MonthlySummary extends StatelessWidget {
  final int amount;

  const MonthlySummary({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 4),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'July Spended',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            CurrencyFormat.convertToIdr(amount, 0),
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
