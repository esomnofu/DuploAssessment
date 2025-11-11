import 'dart:async';
import 'package:duplo/base/base_vm.dart';
import 'package:duplo/model/kyc.dart';
import 'package:duplo/modules/kyc/kyc_screen.dart';
import 'package:duplo/services/kyc_api_service.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class KycViewModel extends BaseViewModel {
  final BuildContext context;

  KycViewModel({required this.context});

  @override
  FutureOr<void> init() {
    updateKycConnectionString(dotenv.env['DB_KYC_KEY'] ?? '');
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
      var kyc = Kyc.fromJson(item);
      return Card(
        child: ListTile(
          title: Text(kyc.fullName),
          subtitle: Text(
            "(${kyc.houseNumber}) ${kyc.address}\n${kyc.landmark}",
          ),
          leading: CircleAvatar(child: Icon(Icons.home)),
        ),
      );
    }).toList();
  }

  //FORM SECTION
  var fullNameTextEditingController = TextEditingController();
  var landmarkTextEditingController = TextEditingController();
  var houseNumberTextEditingController = TextEditingController();
  var addressTextEditingController = TextEditingController();

  bool _formIsValid = false;
  bool get formIsValid => _formIsValid;

  void formFilledStatusUpdate() {
    if (fullNameTextEditingController.text.trim().length > 1 &&
        landmarkTextEditingController.text.trim().length > 1 &&
        houseNumberTextEditingController.text.trim().length > 1 &&
        addressTextEditingController.text.trim().length > 1) {
      _formIsValid = true;
    } else {
      _formIsValid = false;
    }
    notifyListeners();
  }

  Future addKyc() async {
    var kycModel = Kyc(
      address: addressTextEditingController.text.trim(),
      fullName: fullNameTextEditingController.text.trim(),
      houseNumber: int.parse(houseNumberTextEditingController.text.trim()),
      landmark: landmarkTextEditingController.text.trim(),
    );
    changeLoaderStatus(true);
    var status = await KycApiService.shared().createNewKyc(kycModel);
    changeLoaderStatus(false);
    if (status && context.mounted) {
      showSuccessDialog(
        context,
        "Kyc added successfully",
        "Click okay to view kyc list",
        () {
          Navigator.pop(context);
          clearAllFields();
          navigateToScreen(context, KycScreen());
        },
      );
    } else {
      showFailureToast("Something went wrong adding kyc");
    }
  }

  clearAllFields() {
    fullNameTextEditingController.clear();
    landmarkTextEditingController.clear();
    houseNumberTextEditingController.clear();
    addressTextEditingController.clear();
  }
}
