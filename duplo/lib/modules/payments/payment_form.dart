import 'package:duplo/base/base_screen.dart';
import 'package:duplo/modules/payments/payment_vm.dart';
import 'package:duplo/widgets/bottom_border_textfield.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class PaymentFormScreen extends StatelessWidget {
  const PaymentFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<PaymentViewModel>(
      vmBuilder: (context) => PaymentViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, PaymentViewModel vm) {
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
                textController: vm.itemNameTEC,
                hinttext: "Item Name",
                hintColor: Colors.grey,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(40),
              BottomBorderTextField(
                textController: vm.priceTEC,
                hinttext: "Price",
                keyboardType: TextInputType.number,
                hintColor: Colors.grey,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(40),
              BottomBorderTextField(
                textController: vm.qtyTEC,
                hinttext: "Quantity",
                keyboardType: TextInputType.number,
                hintColor: Colors.grey,
                onChanged: (p0) => vm.formFilledStatusUpdate(),
              ),
              addVerticalSpacing(100),
              vm.formIsValid
                  ? PrimaryButton(
                      title: "Submit",
                      onPressed: () async => await vm.addPayment(),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    ),
  );
}
