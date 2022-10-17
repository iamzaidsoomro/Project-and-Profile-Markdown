class Customer {
  String name;
  String email;
  double balance;

  Customer({
    required this.balance,
    required this.email,
    required this.name,
  });

  static Customer fromJson(json) => Customer(
        balance: json['balance'],
        email: json['email'],
        name: json['name'],
      );

  @override
  String toString() {
    return '''Customer{
      name: $name,
      email: $email,
      balance:$balance}\n''';
  }
}
