import 'package:flutter/material.dart';

addVerticalSpacing(double height) {
  return SizedBox(height: height);
}

addHorizontalSpacing(double width) {
  return SizedBox(width: width);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

navigateToScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

navigateToScreenAndRemoveAll(BuildContext context, Widget screen) {
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => screen),
    (Route<dynamic> route) => false,
  );
}
