import 'package:banking_app/pages/select_operation_page.dart';
import 'package:flutter/material.dart';

import '../db/db_helper.dart';
import '../model/customer.dart';
import '../widgets/customer_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  final _dbHelper = DbHelper.instance;
  List<Customer> customerList = [];
  @override
  void initState() {
    super.initState();
    loadData();
    loadData();
  }

  loadData() async {
    setState(() {
      isLoading = true;
    });
    final data = await _dbHelper.getAllCustomers();
    print(data.length);
    setState(() {
      customerList = data;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    print("done");
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All customers'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: loadData, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                  strokeWidth: 5,
                ),
              )
            : customerList.isEmpty
                ? const Center(
                    child: Text('No data available.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    itemCount: customerList.length,
                    itemBuilder: (context, index) => CustomerCard(
                      customer: customerList[index],
                      onPressed: () async {
                        final answer = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) {
                            return SelectOperationPage(
                              customerList: customerList,
                              selectedCustomer: customerList[index],
                            );
                          }),
                        );
                        if (answer != null && answer == 1) {
                          loadData();
                        }
                      },
                    ),
                  ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await _dbHelper.deleteDb();
      //   },
      // ),
    );
  }
}
