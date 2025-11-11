// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);
import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  String itemName;
  int price;
  int quantity;

  Payment({
    required this.itemName,
    required this.price,
    required this.quantity,
  });

  factory Payment.fromJson(dynamic json) => Payment(
    itemName: json["item_name"],
    price: json["price"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "item_name": itemName,
    "price": price,
    "quantity": quantity,
  };
}
