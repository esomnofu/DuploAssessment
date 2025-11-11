import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

String formatAmount(int value) {
  var formatter = NumberFormat('#,###,000');
  return formatter.format(value);
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

void showSuccessDialog(
  BuildContext context,
  String title,
  String message,
  Function callback,
) {
  //Show a cupertino alert instead of implementing a firebase push notification implementation
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(child: Text("Okay"), onPressed: () => callback()),
      ],
    ),
  );
}
