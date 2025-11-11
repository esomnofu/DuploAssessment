import 'package:flutter/material.dart';

class UserFormButton extends StatelessWidget {
  final String title;
  final Function onTapped;
  const UserFormButton({
    super.key,
    required this.title,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            12.0,
          ), // Applies a 20-pixel radius to all corners
        ),
        height: 100,
        width: 150,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
