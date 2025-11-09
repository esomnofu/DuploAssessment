import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.height = 45,
    this.width = 45,
    this.strokeWidth = 8,
  });
  final double height;
  final double width;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(color: Colors.blueAccent.withValues(alpha: 0.4)),
        SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            strokeWidth: strokeWidth,
            backgroundColor: Colors.blue,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ],
    );
  }
}
