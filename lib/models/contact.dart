import 'package:flutter/material.dart';

class Contact {
  final int id;
  final String name;
  final int accountNumber;
  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  /**
   * P/ testar o funcionamento, será usado juntamente com a callback then para
   * exibir os dados recebidos
   */
  @override
  String toString() {
    return 'Contact{id: $id, name: $name, accountNumber: $accountNumber}';
  }
}
