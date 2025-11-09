import 'package:duplo/widgets/helper_functions.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25.0),
      ),
      width: getScreenWidth(context) - 50,
      height: 50,
      child: TextButton(
        child: Text(title, style: TextStyle(color: Colors.white)),
        onPressed: () => onPressed(),
      ),
    );
  }
}
