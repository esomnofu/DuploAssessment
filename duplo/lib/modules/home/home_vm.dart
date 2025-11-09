import 'dart:async';
import 'package:duplo/base/base_vm.dart';
import 'package:duplo/modules/auth/sign_up_screen.dart';
import 'package:duplo/services/auth_api_service.dart';
import 'package:duplo/widgets/helper_functions.dart';
import 'package:duplo/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends BaseViewModel {
  final BuildContext context;

  HomeViewModel({required this.context});

  @override
  FutureOr<void> init() {
    updateUser(FirebaseAuth.instance.currentUser);
  }

  User? _loggedInUser;
  User? get loggedInUser => _loggedInUser;

  updateUser(User? user) {
    _loggedInUser = user;
    notifyListeners();
  }

  Future<dynamic> logout() async {
    changeLoaderStatus(true);
    bool signOutResponse = await AuthApiService.shared().signOut();
    changeLoaderStatus(false);
    if (signOutResponse == true) {
      showSuccessToast("Sign out successful!");
      await Future.delayed(const Duration(seconds: 3));
      if (context.mounted) {
        navigateToScreenAndRemoveAll(context, SignUpScreen());
      }
    } else {
      showFailureToast("Something went wrong signing out - please try again!");
    }
  }
}
