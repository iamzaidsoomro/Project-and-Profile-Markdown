import 'package:banking_app/pages/select_customer_page.dart';
import 'package:banking_app/pages/transaction_history.dart';
import 'package:flutter/material.dart';

import '../model/customer.dart';

class SelectOperationPage extends StatelessWidget {
  const SelectOperationPage(
      {super.key, required this.selectedCustomer, required this.customerList});
  final Customer selectedCustomer;
  final List<Customer> customerList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose an operation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildRoundedButton(
              'Transfer Money',
              () => onTransferMoneyBtnPressed(context),
            ),
            const SizedBox(width: 10, height: 10),
            buildRoundedButton(
              'View Transactions',
              () => onViewTransactionPressed(context),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildRoundedButton(String btnText, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(btnText),
      ),
    );
  }

  void onTransferMoneyBtnPressed(context) async {
    final thisCustomerList = customerList
        .where((customer) => customer.name != selectedCustomer.name)
        .toList();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return SelectCustomerPage(
          customerList: thisCustomerList,
          selected: selectedCustomer,
        );
      }),
    );
  }

  void onViewTransactionPressed(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) {
        return TransactionHistoryPage(
          selectedCustomer: selectedCustomer,
        );
      }),
    );
  }
}
