import 'dart:async';
import 'package:duplo/base/base_vm.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends BaseViewModel {
  final BuildContext context;

  SignUpViewModel({required this.context});

  @override
  FutureOr<void> init() {}

  void doFirebaseAnonymousSignUp() {}
}
