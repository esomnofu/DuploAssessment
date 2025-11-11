import 'package:duplo/base/base_screen.dart';
import 'package:duplo/modules/home/home_vm.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/primary_button.dart';
import 'package:duplo/widgets/user_form_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      vmBuilder: (context) => HomeViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, HomeViewModel vm) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome User (${vm.loggedInUser?.uid.substring(0, 3)})",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            addVerticalSpacing(100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UserFormButton(
                  title: "New Kyc",
                  onTapped: () => vm.gotoKycForm(),
                ),

                UserFormButton(
                  title: "New Payment",
                  onTapped: () => vm.gotoPaymentForm(),
                ),
              ],
            ),
            Spacer(),
            Center(
              child: PrimaryButton(
                title: "LOG OUT",
                onPressed: () async => await vm.logout(),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
