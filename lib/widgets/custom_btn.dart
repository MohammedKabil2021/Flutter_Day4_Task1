import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final Color? backgroundColor;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final double? borderWidth;

  const CustomBtn({
    super.key,
    required this.text,
    required this.width,
    required this.height,
    this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,

          textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color:
                  borderColor ??
                  Colors.black, // Default border color if not provided
              width: borderWidth ?? 2.0, // Default border width if not provided
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
