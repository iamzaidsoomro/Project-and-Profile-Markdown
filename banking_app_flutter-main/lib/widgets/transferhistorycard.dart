import 'package:flutter/material.dart';

import '../model/transfer_transaction.dart';

class TransferTransactionCard extends StatelessWidget {
  const TransferTransactionCard({Key? key, required this.transaction})
      : super(key: key);
  final TransferTransaction transaction;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        title: Text('To: ${transaction.to}(${transaction.toEmail})'),
        subtitle: Text('Amount: \$${transaction.amount}'),
        tileColor: Colors.blue,
        textColor: Colors.white,
      ),
    );
  }
}
