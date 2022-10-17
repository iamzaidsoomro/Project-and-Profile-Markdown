import 'package:banking_app/model/customer.dart';
import 'package:banking_app/model/transfer_transaction.dart';
import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../widgets/transferhistorycard.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({super.key, required this.selectedCustomer});
  final Customer selectedCustomer;
  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  bool isLoading = false;
  final _dbHelper = DbHelper.instance;
  List<TransferTransaction> transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransactionHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ),
            )
          : transactions.isEmpty
              ? const Center(child: Text('No transaction history.'))
              : ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (_, index) => TransferTransactionCard(
                    transaction: transactions[index],
                  ),
                ),
    );
  }

  void loadTransactionHistory() async {
    setState(() {
      isLoading = true;
    });
    final history =
        await _dbHelper.getAllTransfersOfCustomer(widget.selectedCustomer);
    if (history.isNotEmpty) {
      setState(() {
        transactions = history;
      });
    }
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      isLoading = false;
    });
  }
}
