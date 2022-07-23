import 'package:flutter/material.dart';
import 'package:flutter_app_money_tracker/models/transaction_model.dart';
import 'package:intl/intl.dart';

import '../utils/currency_format.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction e;

  const TransactionWidget({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      key: Key(e.id),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Card(
          elevation: 2,
          key: Key(e.id),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        child: Text(
                          DateFormat.d().format(e.date),
                          style: const TextStyle(fontSize: 9),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.title.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(e.date),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Text(
                  CurrencyFormat.convertToIdr(e.amount, 0),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
