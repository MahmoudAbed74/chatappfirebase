import 'package:flutter/material.dart';

class Custome_ElevatedButton extends StatelessWidget {
  const Custome_ElevatedButton({
    super.key, required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child:  Text(
       text,
        style:const  TextStyle(fontSize: 20, color: Colors.black),
      ),
    );
  }
}

