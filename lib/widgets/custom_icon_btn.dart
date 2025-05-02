import 'package:flutter/material.dart';

class CustomIconBtn extends StatelessWidget {
  final String txt;
  final String img_icon;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final double? iconWidth;
  final double? iconHeight;
  final AlignmentGeometry? textAlignment;
  final AlignmentGeometry? iconAlignment;
  final EdgeInsets? iconPadding;
  final Color? borderColor;
  final double? borderWidth;
  final Color? backgroundColor;

  const CustomIconBtn({
    Key? key,
    required this.txt,
    required this.img_icon,
    this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.iconWidth,
    this.iconHeight,
    this.textAlignment = Alignment.center,
    this.iconAlignment = Alignment.centerLeft,
    this.iconPadding,
    this.borderColor,
    this.borderWidth,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 350,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color:
                  borderColor ??
                  Colors.black, // Default border color if not provided
              width: borderWidth ?? 2.0, // Default border width if not provided
            ),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: iconAlignment!,
              child: Padding(
                padding:
                    iconPadding ??
                    EdgeInsets
                        .zero, // استخدم الـ padding المخصص أو مفيش padding
                child: SizedBox(
                  width: iconWidth,
                  height: iconHeight,
                  child: Image.asset(
                    img_icon,
                    width: iconWidth,
                    height: iconHeight,
                  ),
                ),
              ),
            ),
            Align(
              alignment: textAlignment!,
              child: Text(
                txt,
                style:
                    textStyle ??
                    const TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 122, 122, 122),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
