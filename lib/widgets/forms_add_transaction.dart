import 'package:flutter/material.dart';

class FormsAddTransaction extends StatelessWidget {
  const FormsAddTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 100,
              ),
              child: const TextField(
                  maxLines: null,
                  decoration: InputDecoration(label: Text('Title')))),
          const TextField(
            decoration: InputDecoration(label: Text('Amount')),
            keyboardType:
                TextInputType.numberWithOptions(signed: false, decimal: false),
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Category')),
            maxLength: 30,
          ),
          OutlinedButton(
              onPressed: () => {},
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
