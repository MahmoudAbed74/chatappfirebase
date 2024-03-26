import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/model/messageModel.dart';
import 'package:chatappfirebase/widgets/chatBubble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id_ChatPage = "/chat";
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessages);
  TextEditingController controller = TextEditingController();
  String? messageDate;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: message.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data!.docs[0][kMessages]);
            List<messageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(messageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: kBlueColor,
                  automaticallyImplyLeading: false,
                  title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Chat_Bubble(
                            messageText: snapshot.data!.docs[index][kMessages],
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: controller,
                      onChanged: (value) {
                        messageDate = value;
                      },
                      onSubmitted: (data) {
                        message.add({kMessages: data});
                        controller.clear();
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Message",
                          suffixIcon: IconButton(
                            onPressed: () {
                              message.add({kMessages: messageDate});
                              controller.clear();
                            },
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
