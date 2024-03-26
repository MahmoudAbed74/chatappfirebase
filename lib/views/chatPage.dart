import 'package:flutter/material.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/widgets/chatBubble.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id_ChatPage = "/chat";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueColor,
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Chat_Bubble();
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Enter Message",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(
                      color: kBlueColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: kSecondaryColor,
                      ))),
            )
          ],
        ));
  }
}
