import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duplo/base/base_screen.dart';
import 'package:duplo/modules/payments/payment_vm.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PaymentViewModel>(
      vmBuilder: (context) => PaymentViewModel(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, PaymentViewModel vm) {
    return Scaffold(
      appBar: AppBar(title: Text('Payment List')),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(vm.kycDbConnectionString)
            .snapshots(),
        builder: (context, snapshot) {
          return ListView(children: vm.makeListWidget(snapshot));
        },
      ),
    );
  }
}
