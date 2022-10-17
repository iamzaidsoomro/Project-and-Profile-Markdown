import 'dart:async';

import 'package:faker/faker.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

import '../model/customer.dart';
import '../model/transfer_transaction.dart';

class DbHelper {
  static DbHelper instance = DbHelper._();
  static const String tableName = 'CUSTOMERS';
  static const String tableName2 = 'TRANSFERS';
  DbHelper._();
  Database? _database;

  Future<Database> get database async {
    return _database ??= await openDatabase(
      p.join(await getDatabasesPath(), "Mydb.db"),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<List<Customer>> getAllCustomers() async {
    List<Customer> customers = [];
    final db = await instance.database;
    final result = await db.query(tableName);
    for (var customerData in result) {
      customers.add(Customer.fromJson(customerData));
    }
    return customers;
  }

  Future updateCustomer(Customer customer) async {
    final db = await instance.database;
    await db.rawUpdate(
      'Update $tableName Set balance=? where name=?',
      [
        customer.balance,
        customer.name,
      ],
    );
    print('updated');
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute("""CREATE TABLE $tableName(
      name TEXT Primary Key,
      email TEXT, 
      balance REAL
      )""");
    await db.execute("""CREATE TABLE $tableName2(
      from_name TEXT,
      to_name TEXT, 
      to_email TEXT,
      from_email TEXT,
      amount REAL
      )""");
    print("$tableName created");
    print("$tableName2 created");
    _insertCustomerData();
  }

  Future addTransfer(TransferTransaction transfer) async {
    final db = await instance.database;
    await db.insert(
      tableName2,
      {
        'to_name': transfer.to,
        'from_name': transfer.from,
        'from_email': transfer.fromEmail,
        'to_email': transfer.toEmail,
        'amount': transfer.amount,
      },
    );
    print("$transfer inserted into db");
  }

  Future<List<TransferTransaction>> getAllTransfersOfCustomer(
      Customer customer) async {
    List<TransferTransaction> transfers = [];
    final db = await database;
    final result = await db.query(
      tableName2,
      where: 'to_name=? OR from_name=?',
      whereArgs: [
        customer.name,
        customer.name,
      ],
    );
    for (var transferData in result) {
      transfers.add(TransferTransaction.fromJson(transferData));
    }
    return transfers;
  }

  void _insertCustomerData() async {
    final db = await instance.database;
    Faker faker = Faker();
    String insertQuery = "INSERT INTO $tableName Values";
    for (var i = 0; i < 10; i++) {
      String name = faker.person.name();
      name = name.replaceAll("'", "");
      String email = faker.internet.email();
      email = email.replaceAll("'", "");
      final balance = faker.randomGenerator.decimal(min: 315, scale: 20000);
      insertQuery += "('$name','$email',${balance.toStringAsFixed(2)}),";
    }
    insertQuery = insertQuery.substring(0, insertQuery.length - 1);
    print('Query: $insertQuery');
    await db.rawInsert(insertQuery);
    print("Rows inserted");
  }

  Future deleteDb() async {
    await deleteDatabase(p.join(await getDatabasesPath(), 'Mydb.db'));
    _database = null;
    print("deleted");
  }
}
