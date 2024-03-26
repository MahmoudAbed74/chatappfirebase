import 'package:flutter/material.dart';

class Chat_Bubble extends StatelessWidget {
  const Chat_Bubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20)),
          ),
          child: const Text(
            "Chat Page ",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
