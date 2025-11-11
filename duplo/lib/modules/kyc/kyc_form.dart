import 'package:duplo/base/base_screen.dart';
import 'package:duplo/modules/kyc/kyc_vm.dart';
import 'package:duplo/widgets/bottom_border_textfield.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class KycFormScreen extends StatelessWidget {
  const KycFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<KycViewModel>(
      vmBuilder: (context) => KycViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, KycViewModel vm) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpacing(50),
              BottomBorderTextField(
                textController: vm.fullNameTextEditingController,
                hinttext: "Full Name",
                hintColor: Colors.grey,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(40),
              BottomBorderTextField(
                textController: vm.landmarkTextEditingController,
                hinttext: "Landmark",
                hintColor: Colors.grey,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(40),
              BottomBorderTextField(
                textController: vm.houseNumberTextEditingController,
                hinttext: "House Number",
                hintColor: Colors.grey,
                keyboardType: TextInputType.number,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(40),
              BottomBorderTextField(
                textController: vm.addressTextEditingController,
                hinttext: "Address",
                hintColor: Colors.grey,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(100),
              vm.formIsValid
                  ? PrimaryButton(
                      title: "Submit",
                      onPressed: () async => await vm.addKyc(),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    ),
  );
}
