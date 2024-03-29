import 'dart:ffi';

import 'package:flutter/material.dart';

class Custome_TextField extends StatelessWidget {
  Custome_TextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.onChanged,
    this.obscureText = false,
  });
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final bool? obscureText;

  final Function(String data)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      validator: (value) {
        if (value!.isEmpty) {
          "Please enter your $labelText";
        } else if (value.length < 6) {
          "Password must be at least 6 characters";
        } else if (value.length > 20) {
          "Password must be less than 20 characters";
        } else if (value.contains(RegExp(r'\s'))) {
          "Password cannot contain spaces";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        // suffix: IconButton(
        //   icon: obscureText == true
        //       ? Icon(Icons.remove_red_eye)
        //       : Icon(Icons.panorama_fish_eye),
        //   onPressed: () {
        //     obscureText = !obscureText!;
        //   },
        // ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.amberAccent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.green)),
      ),
    );
  }
}
