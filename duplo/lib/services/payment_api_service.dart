import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duplo/model/payment.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class PaymentApiService {
  static final PaymentApiService _sharedInstance = PaymentApiService();
  static PaymentApiService shared() {
    return _sharedInstance;
  }

  Future<bool> createNewPayment(Payment model) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore
          .collection(dotenv.env['DB_PAYMENTS_KEY'] ?? '')
          .add(model.toJson());
      debugPrint('Payment added successfully!');
      return true;
    } catch (e) {
      debugPrint('Error adding payment: $e');
      return false;
    }
  }
}
