import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
 static String id_ChatPage = "/chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset( "assets/images/logo1.jpeg"),
            const Text("Chat Page"),
          ]
        ),
        centerTitle: true,

      ),
    );
  }
}