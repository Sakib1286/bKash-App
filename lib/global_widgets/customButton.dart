import 'package:flutter/material.dart';

class CustomTextfeild extends StatelessWidget {
  final String title;
  final bool? secured;
  final IconData? prefixIcon;
  final TextInputType? keyboard;
  final TextEditingController? controller;
  const CustomTextfeild(
      {super.key,
      required this.title,
      this.secured,
      this.prefixIcon,
      this.keyboard,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboard,
      obscureText: secured ?? false,
      decoration: InputDecoration(
        prefix: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: Colors.black.withOpacity(.5),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: BorderSide(color: Colors.black.withOpacity(.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40.0),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
        hintText: title,
      ),
    );
  }
}
