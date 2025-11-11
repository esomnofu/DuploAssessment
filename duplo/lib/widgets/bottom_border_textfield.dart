import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomBorderTextField extends StatelessWidget {
  const BottomBorderTextField({
    super.key,
    required this.textController,
    this.hinttext,
    this.isEnabled = true,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.contentPadding,
    this.onTap,
    this.validateFn,
    this.readOnly = false,
    this.hintColor,
    this.suffixWidget,
    this.formatter,
    this.keyboardType = TextInputType.name,
    this.isBorderLineVisible = true,
  });

  final TextEditingController textController;
  final Color? hintColor;
  final String? hinttext;
  final bool isEnabled;
  final bool readOnly;
  final int maxLines;
  final int? maxLength;
  final Widget? suffixWidget;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final TextInputFormatter? formatter;
  final dynamic validateFn;
  final bool isBorderLineVisible;

  @override
  Widget build(BuildContext context) {
    var underlineInputBorder = UnderlineInputBorder(
      borderSide: isBorderLineVisible
          ? BorderSide(width: 1.50, color: Colors.grey)
          : BorderSide.none,
    );
    return TextFormField(
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      controller: textController,
      cursorColor: Colors.grey.withValues(alpha: 0.4),
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validateFn,
      inputFormatters: [
        formatter ?? FilteringTextInputFormatter.singleLineFormatter,
      ],
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(color: hintColor),
        counterText: "",
        alignLabelWithHint: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(vertical: 16),
        isDense: true,
        enabled: isEnabled,
        border: underlineInputBorder,
        focusedBorder: underlineInputBorder,
        disabledBorder: underlineInputBorder,
        enabledBorder: underlineInputBorder,
        suffixIcon: suffixWidget ?? const SizedBox.shrink(),
      ),
    );
  }
}
