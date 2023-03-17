import 'package:flutter/material.dart';
import 'package:flutter_practical_test/constant/const.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final double? fontSize;
  final IconData icon;
  final Color? backgroundColor;
  final TextInputType? inputType;
  final bool? obscureText;
  final bool? onExit;
  final void Function(String value) onChange;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.backgroundColor,
    this.fontSize,
    this.inputType,
    this.obscureText = false,
    this.onExit = false,
    required this.onChange,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => widget.onChange(value),
      keyboardType: widget.inputType ?? TextInputType.text,
      obscureText: widget.obscureText! ? passwordVisible : widget.obscureText!,
      decoration: InputDecoration(
        prefixIcon: Icon(
          widget.icon,
          color: Colors.grey.shade400,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: widget.fontSize ?? 13, color: Colors.grey.shade400),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.circular(Const.borderRadius),
        ),
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        filled: true,
        fillColor: Colors.grey.shade900,
      ),
      style: TextStyle(
          color: Colors.grey.shade400, fontSize: widget.fontSize ?? 13),
    );
  }
}
