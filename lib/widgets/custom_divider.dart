import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String? txt;
  final Color? color;
  final double thickness;
  final double indent;
  final double endIndent;
  final TextStyle? textStyle;

  const CustomDivider({
    Key? key,
    this.txt,
    this.color,
    this.thickness = 1.0,
    this.indent = 0.0,
    this.endIndent = 0.0,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (txt != null && txt!.isNotEmpty) {
      return Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: color ?? Colors.grey[300],
              thickness: thickness,
              indent: indent,
              endIndent: 8.0, // space between txt and line
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              txt!,
              style:
                  textStyle ?? TextStyle(color: Colors.black54, fontSize: 16.0),
            ),
          ),
          Expanded(
            child: Divider(
              color: color ?? Colors.grey[300],
              thickness: thickness,
              indent: 8.0, // space between txt and line
              endIndent: endIndent,
            ),
          ),
        ],
      );
    } else {
      return Divider(
        color: color ?? Colors.grey[300],
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        height: 20.0, // ممكن نحدد ارتفاع عشان يكون شكله واضح لو مفيش نص
      );
    }
  }
}
