import 'dart:async';

import 'package:banking_app/db/db_helper.dart';
import 'package:banking_app/model/transfer_transaction.dart';
import 'package:flutter/material.dart';

import '../model/customer.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage(
      {super.key, required this.fromCustomer, required this.toCustomer});
  final Customer fromCustomer;
  final Customer toCustomer;

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  final formKey = GlobalKey<FormState>();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter amount'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              buildHeader(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildAvailableBalance(),
                  const SizedBox(width: 10, height: 30),
                  buildAmountTextField(),
                  const SizedBox(width: 10, height: 10),
                  buildTransferBtn(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Align buildAvailableBalance() {
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Available balance: ',
            style: buildDialogTextStyle(color: Colors.black, fontSize: 15),
          ),
          Text(
            '\$${widget.fromCustomer.balance}',
            style: const TextStyle(
              fontSize: 15,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Column buildHeader() {
    return Column(
      children: [
        Text(
          'From',
          style: buildDialogTextStyle(color: Colors.black),
        ),
        Text(
          widget.fromCustomer.name,
          style: buildDialogTextStyle(fontSize: 25),
        ),
        const SizedBox(width: 10, height: 10),
        Text(
          'To',
          style: buildDialogTextStyle(color: Colors.black),
        ),
        Text(
          widget.toCustomer.name,
          style: buildDialogTextStyle(fontSize: 25),
        ),
      ],
    );
  }

  ElevatedButton buildTransferBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onTransferBtnPressed,
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Text('Transfer'),
      ),
    );
  }

  TextFormField buildAmountTextField() {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: '\$ amount',
      ),
      controller: amountController,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'enter an amount.';
        }
        if (double.parse(val) > widget.fromCustomer.balance) {
          return 'not enough balance.';
        }
        return null;
      },
    );
  }

  AlertDialog buildAlertDialog(double amount) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(20.0),
      title: Center(
        child: Text(
          'Transfer Successful',
          style: buildDialogTextStyle(
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(width: 10, height: 10),
          Text(
            'From',
            style: buildDialogTextStyle(color: Colors.black),
          ),
          Text(
            widget.fromCustomer.name,
            style: buildDialogTextStyle(),
          ),
          const SizedBox(width: 10, height: 10),
          Text(
            'To',
            style: buildDialogTextStyle(color: Colors.black),
          ),
          Text(
            widget.toCustomer.name,
            style: buildDialogTextStyle(),
          ),
          const SizedBox(width: 10, height: 10),
          Text(
            'Amount',
            style: buildDialogTextStyle(color: Colors.black),
          ),
          Text(
            '\$$amount',
            style: buildDialogTextStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle buildDialogTextStyle(
      {Color color = Colors.blue, double fontSize = 20}) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
    );
  }

  void onTransferBtnPressed() async {
    if (formKey.currentState!.validate()) {
      final amount = double.parse(amountController.text);
      TransferTransaction transaction = TransferTransaction(
        amount: double.parse(amountController.text),
        to: widget.toCustomer.name,
        from: widget.fromCustomer.name,
        fromEmail: widget.fromCustomer.email,
        toEmail: widget.toCustomer.email,
      );
      print(transaction);
      await DbHelper.instance.addTransfer(transaction);
      // print("From Customer before: ${widget.fromCustomer}");
      // print("To Customer before: ${widget.toCustomer}");
      widget.fromCustomer.balance -= amount;
      widget.toCustomer.balance += amount;
      await DbHelper.instance.updateCustomer(widget.fromCustomer);
      await DbHelper.instance.updateCustomer(widget.toCustomer);
      // print("From Customer after: ${widget.fromCustomer}");
      // print("To Customer after: ${widget.toCustomer}");
      amountController.clear();
      setState(() {});
      await showDialog(
        context: context,
        // ignore: prefer_const_constructors
        builder: (context) {
          Timer(const Duration(milliseconds: 1200), () {
            Navigator.pop(context);
          });
          return buildAlertDialog(amount);
        },
      );
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      // ignore: use_build_context_synchronously
      Navigator.pop(context, 1);
    } else {
      print("Validation failed");
    }
  }
}
