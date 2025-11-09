import 'dart:async';
import 'package:duplo/base/base_vm.dart';
import 'package:duplo/modules/auth/sign_up_screen.dart';
import 'package:duplo/modules/home/home_screen.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
        if (context.mounted) {
          navigateToScreenAndRemoveAll(context, SignUpScreen());
        }
      } else {
        debugPrint('User is signed in!');
        if (context.mounted) {
          navigateToScreenAndRemoveAll(context, HomeScreen());
        }
      }
    });
  }
}
