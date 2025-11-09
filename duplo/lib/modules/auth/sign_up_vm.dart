import 'dart:async';
import 'package:duplo/base/base_vm.dart';
import 'package:duplo/modules/home/home_screen.dart';
import 'package:duplo/services/auth_api_service.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final BuildContext context;

  SignUpViewModel({required this.context});

  @override
  FutureOr<void> init() {}

  Future<void> doFirebaseAnonymousSignUp() async {
    changeLoaderStatus(true);
    UserCredential? signUpResponse = await AuthApiService.shared()
        .signUpAnonymously();
    changeLoaderStatus(false);
    if (signUpResponse != null) {
      debugPrint("signUpResponse is $signUpResponse");
      showSuccessToast("Sign up successful!");
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        navigateToScreenAndRemoveAll(context, HomeScreen());
      }
    } else {
      debugPrint("sign up process failed");
      showFailureToast("Something went wrong with signup!");
    }
  }
}
