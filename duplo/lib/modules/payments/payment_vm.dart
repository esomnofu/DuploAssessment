import 'dart:async';
import 'dart:developer';
import 'package:duplo/base/base_vm.dart';
import 'package:duplo/model/payment.dart';
import 'package:duplo/modules/payments/payment_screen.dart';
import 'package:duplo/services/payment_api_service.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PaymentViewModel extends BaseViewModel {
  final BuildContext context;

  PaymentViewModel({required this.context});

  @override
  FutureOr<void> init() {
    updateKycConnectionString(dotenv.env['DB_PAYMENTS_KEY'] ?? '');
  }

  String _kycDbConnectionString = "";
  String get kycDbConnectionString => _kycDbConnectionString;

  updateKycConnectionString(String value) {
    _kycDbConnectionString = value;
    notifyListeners();
  }

  List<Widget> makeListWidget(AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return [Center(child: Text('Error: ${snapshot.error}'))];
    }

    if (snapshot.connectionState == ConnectionState.waiting) {
      return [Center(child: CircularProgressIndicator())];
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return [Center(child: Text('Document does not exist'))];
    }
    return snapshot.data?.docs.map<Widget>((item) {
      inspect(item);
      var payment = Payment.fromJson(item);
      return Card(
        child: ListTile(
          title: Text("Item: ${payment.itemName}"),
          subtitle: Text(
            "Price: NGN ${formatAmount(payment.price)} \nQty:${payment.quantity}",
          ),
          leading: CircleAvatar(child: Icon(Icons.wallet)),
        ),
      );
    }).toList();
  }

  //FORM SECTION
  var itemNameTEC = TextEditingController();
  var priceTEC = TextEditingController();
  var qtyTEC = TextEditingController();

  bool _formIsValid = false;
  bool get formIsValid => _formIsValid;

  void formFilledStatusUpdate() {
    if (itemNameTEC.text.trim().isNotEmpty &&
        priceTEC.text.trim().isNotEmpty &&
        qtyTEC.text.trim().isNotEmpty) {
      _formIsValid = true;
    } else {
      _formIsValid = false;
    }
    notifyListeners();
  }

  Future addPayment() async {
    var kycModel = Payment(
      itemName: itemNameTEC.text.trim(),
      price: int.parse(priceTEC.text.trim()),
      quantity: int.parse(qtyTEC.text.trim()),
    );
    changeLoaderStatus(true);
    var status = await PaymentApiService.shared().createNewPayment(kycModel);
    changeLoaderStatus(false);
    if (status && context.mounted) {
      showSuccessDialog(
        context,
        "Payment added successfully",
        "Click okay to view kyc list",
        () {
          Navigator.pop(context);
          clearAllFields();
          navigateToScreen(context, PaymentScreen());
        },
      );
    } else {
      showFailureToast("Something went wrong adding kyc");
    }
  }

  clearAllFields() {
    itemNameTEC.clear();
    priceTEC.clear();
    qtyTEC.clear();
  }
}
