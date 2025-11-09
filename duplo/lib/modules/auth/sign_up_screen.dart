import 'package:duplo/base/base_screen.dart';
import 'package:duplo/modules/auth/sign_up_vm.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      vmBuilder: (context) => SignUpViewModel(context: context),
      builder: _buildScreen,
    );
  }
}

Widget _buildScreen(BuildContext context, SignUpViewModel vm) {
  return Scaffold(
    backgroundColor: Colors.amber,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to Duplo!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            addVerticalSpacing(10),
            Text(
              "Lets sign you up.",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
            addVerticalSpacing(50),
          ],
        ),
      ),
    ),
  );
}
