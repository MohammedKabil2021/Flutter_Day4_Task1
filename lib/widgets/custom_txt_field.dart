import 'package:flutter/material.dart';

class CustomTxtField extends StatefulWidget {
  final String hintTxt;
  final TextEditingController? controller;
  final bool obscureTxt;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  final String? label;
  final bool isPassword;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? labelFontSize;
  final Color? fillColor;
  final bool filled;
  // final double? errorFontSize;

  const CustomTxtField({
    //Key? key,
    super.key,
    required this.hintTxt,
    this.controller,
    this.obscureTxt = false,
    this.validator,
    this.suffixIcon,
    this.label,
    this.isPassword = false,
    required this.prefixIcon,
    this.width,
    this.height,
    this.fontSize,
    this.labelFontSize,
    this.fillColor,
    this.filled = false,
  });

  @override
  State<CustomTxtField> createState() => _CustomTxtFieldState();
}

class _CustomTxtFieldState extends State<CustomTxtField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureTxt;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: widget.width ?? double.infinity,
        child: TextFormField(
          obscureText: _obscureText,
          controller: widget.controller,
          validator: widget.validator,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: widget.fontSize ?? 16,
          ),
          decoration: InputDecoration(
            hintText: widget.hintTxt,
            filled: widget.filled,
            fillColor: widget.fillColor, // لون الخلفية
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off
                            : Icons.remove_red_eye,
                      ),
                    )
                    : widget.suffixIcon,
            labelText: widget.label,
            labelStyle: TextStyle(
              fontSize: widget.labelFontSize ?? 20,
              color: Colors.grey,
            ),
            errorStyle: TextStyle(
              // color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            contentPadding:
                widget.height != null
                    ? EdgeInsets.symmetric(
                      vertical: widget.height! / 3,
                      horizontal: 16,
                    )
                    : const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          ),
        ),
      ),
    );
  }
}
