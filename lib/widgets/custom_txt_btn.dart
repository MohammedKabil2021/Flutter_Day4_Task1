import 'package:flutter/material.dart';

class CustomTxtBtn extends StatelessWidget {
  final String txt;
  final VoidCallback? onPressed; // Make sure the callback is nullable
  final double? fontSize;
  final Color? txtColor;
  final EdgeInsetsGeometry? padding;
  final FontWeight? fontWeight;
  final MainAxisAlignment alignment;

  const CustomTxtBtn({
    super.key,
    required this.txt,
    this.onPressed, // Nullable callback here
    this.fontSize = 16.0,
    this.txtColor = Colors.blue,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
    this.fontWeight = FontWeight.normal,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          alignment == MainAxisAlignment.center
              ? Alignment.center
              : alignment == MainAxisAlignment.end
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: TextButton(
        onPressed: onPressed, // Directly passing onPressed
        style: TextButton.styleFrom(
          foregroundColor: txtColor,
          padding: padding,
          textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
        child: Text(txt),
      ),
    );
  }
}
