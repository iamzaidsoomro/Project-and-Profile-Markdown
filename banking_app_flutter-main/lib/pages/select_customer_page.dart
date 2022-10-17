import 'package:banking_app/pages/transaction_page.dart';
import 'package:flutter/material.dart';

import '../model/customer.dart';
import '../widgets/customer_card.dart';

class SelectCustomerPage extends StatelessWidget {
  final List<Customer> customerList;
  final Customer selected;

  const SelectCustomerPage({
    super.key,
    required this.customerList,
    required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a customer'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: customerList.length,
          itemBuilder: (_, index) => CustomerCard(
            customer: customerList[index],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => TransactionPage(
                    fromCustomer: selected,
                    toCustomer: customerList[index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
