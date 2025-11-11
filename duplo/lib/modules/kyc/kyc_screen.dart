import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duplo/base/base_screen.dart';
import 'package:duplo/modules/kyc/kyc_vm.dart';
import 'package:flutter/material.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<KycViewModel>(
      vmBuilder: (context) => KycViewModel(context: context),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, KycViewModel vm) {
    return Scaffold(
      appBar: AppBar(title: Text('Kyc List')),
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
