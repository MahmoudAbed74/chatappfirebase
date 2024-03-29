import 'package:flutter/material.dart';

import 'package:chatappfirebase/constants.dart';

class Chat_Bubble extends StatelessWidget {
  const Chat_Bubble({super.key, required this.messageText, required this.Sender, required this.dataTime});
  final String messageText;
  final String Sender;
  final String dataTime;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(Sender , style: const TextStyle(color: Colors.black)),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20)),
            ),
            child: Text(
              messageText,
              style: const TextStyle(color: Colors.white),
            ),
          ),

          const SizedBox(height: 10),
          Text(dataTime, style: const TextStyle(color: Colors.black)),
          
              
        ],
      ),
    );
  }
}
