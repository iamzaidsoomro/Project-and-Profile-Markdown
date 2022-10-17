import 'package:flutter/material.dart';

import '../model/customer.dart';

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    super.key,
    required this.customer,
    required this.onPressed,
  });

  final Customer customer;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.blue,
      child: ListTile(
        onTap: onPressed,
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white.withOpacity(0.9),
          child: Text(
            customer.name.characters.first.toUpperCase(),
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        contentPadding: const EdgeInsets.all(15.0),
        textColor: Colors.white,
        title: Text(customer.name),
        subtitle: Text(customer.email),
        trailing: Text('\$${customer.balance}'),
      ),
    );
  }
}
