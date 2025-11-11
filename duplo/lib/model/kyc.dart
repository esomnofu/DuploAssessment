// To parse this JSON data, do
//
//     final kyc = kycFromJson(jsonString);

import 'dart:convert';

Kyc kycFromJson(String str) => Kyc.fromJson(json.decode(str));

String kycToJson(Kyc data) => json.encode(data.toJson());

class Kyc {
  String address;
  String fullName;
  int houseNumber;
  String landmark;

  Kyc({
    required this.address,
    required this.fullName,
    required this.houseNumber,
    required this.landmark,
  });

  factory Kyc.fromJson(dynamic json) => Kyc(
    address: json["address"],
    fullName: json["full_name"],
    houseNumber: json["house_number"],
    landmark: json["landmark"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "full_name": fullName,
    "house_number": houseNumber,
    "landmark": landmark,
  };
}
