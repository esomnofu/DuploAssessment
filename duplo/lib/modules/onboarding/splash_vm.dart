import 'dart:async';
import 'package:duplo/base/base_vm.dart';
import 'package:duplo/modules/auth/sign_up_screen.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  final BuildContext context;

  SplashViewModel({required this.context});

  @override
  FutureOr<void> init() async {
    Future.delayed(const Duration(seconds: 3), () async {
      await decideNextSteps();
    });
  }

  Future decideNextSteps() async {
    navigateToScreenAndRemoveAll(context, SignUpScreen());
  }
}
