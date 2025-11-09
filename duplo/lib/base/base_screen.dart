import 'package:duplo/base/base_vm.dart';
import 'package:duplo/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({super.key, required this.vmBuilder, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: vmBuilder(context),
      child: Consumer<T>(builder: _buildScreenContent),
    );
  }

  Widget _buildScreenContent(BuildContext context, T viewModel, Widget? child) {
    if (!viewModel.isInitialized && viewModel.isLoading == true) {
      return Container(
        color: Colors.transparent,
        child: const Center(child: Loader()),
      );
    } else {
      return Stack(
        children: [
          builder(context, viewModel),
          Visibility(
            visible: viewModel.isLoading,
            child: const Center(child: Loader()),
          ),
        ],
      );
    }
  }
}
