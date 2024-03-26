import 'package:flutter/material.dart';

class Chat_Bubble extends StatelessWidget {
  const Chat_Bubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15, top: 20),
        height: 50,
        width: 200,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)),
        ),
        child: const Text(
          "Chat Page",
          style: TextStyle(color: Colors.white),
        ));
  }
}
