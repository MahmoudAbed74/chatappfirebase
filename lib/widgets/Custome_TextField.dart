import 'package:flutter/material.dart';

class Custome_TextField extends StatelessWidget {
  const Custome_TextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.onChanged,
  });
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Function(String data)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your $labelText";
        } else if (value.length < 6) {
          return "Password must be at least 6 characters";
        } else if (value.length > 20) {
          return "Password must be less than 20 characters";
        } else if (value.contains(RegExp(r'\s'))) {
          return "Password cannot contain spaces";
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
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
