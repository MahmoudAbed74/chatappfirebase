import 'package:flutter/material.dart';

import 'package:chatappfirebase/widgets/chatBubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id_ChatPage = "/chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/logo1.jpeg",
            height: 20,
            width: 20,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text("Chat Page"),
        ]),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Chat_Bubble();
        },
      ),
    );
  }
}
