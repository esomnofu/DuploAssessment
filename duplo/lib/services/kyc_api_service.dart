import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duplo/model/kyc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final class KycApiService {
  static final KycApiService _sharedInstance = KycApiService();
  static KycApiService shared() {
    return _sharedInstance;
  }

  Future<bool> createNewKyc(Kyc model) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore
          .collection(dotenv.env['DB_KYC_KEY'] ?? '')
          .add(model.toJson());
      debugPrint('Kyc added successfully!');
      return true;
    } catch (e) {
      debugPrint('Error adding kyc: $e');
      return false;
    }
  }
}
