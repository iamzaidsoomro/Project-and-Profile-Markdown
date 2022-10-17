class TransferTransaction {
  String from;
  String to;
  String toEmail;
  String fromEmail;
  double amount;

  TransferTransaction({
    required this.amount,
    required this.to,
    required this.from,
    required this.fromEmail,
    required this.toEmail,
  });

  static TransferTransaction fromJson(json) => TransferTransaction(
        amount: json['amount'],
        from: json['from_name'],
        fromEmail: json['to_email'],
        to: json['to_name'],
        toEmail: json['to_email'],
      );

  @override
  String toString() {
    return '''Transfer{
      From: $from,
      To: $to,
      Amount:$amount}\n''';
  }
}
