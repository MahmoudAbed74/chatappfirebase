import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chatappfirebase/constants.dart';
import 'package:chatappfirebase/model/messageModel.dart';
import 'package:chatappfirebase/widgets/chatBubble.dart';
import 'package:chatappfirebase/widgets/chatBubbleForFriend.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final ScrollController _scrollController = ScrollController();
  static String id_ChatPage = "/chat";
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessages);
  TextEditingController controller = TextEditingController();
  String? messageData;
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: message.orderBy(kDate, descending: true).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
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
                          kLogo,
                          height: 60,
                          width: 100,
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
                        reverse: true,
                        controller: _scrollController,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return messageList[index].sender == email
                              ? Chat_Bubble(
                                  messageText: messageList[index].message,
                                  Sender: messageList[index].sender,
                                  dataTime: messageList[index].date.toString(),
                                )
                              : chatBubbleForFriend(
                                  messageText: messageList[index].message);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: controller,
                      onChanged: (value) {
                        messageData = value;
                      },
                      onSubmitted: (data) {
                        message.add({
                          kMessages: data,
                          kDate: DateTime.now().toLocal().toString(),
                          kSender: email,
                        });
                        controller.clear();
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Message",
                          suffixIcon: IconButton(
                            onPressed: () {
                              message.add({
                                kMessages: messageData,
                                kDate: DateTime.now().toLocal().toString(),
                                kSender: email,
                              });
                              controller.clear();
                              _scrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
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
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
