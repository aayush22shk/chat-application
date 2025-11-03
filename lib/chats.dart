// chats.dart

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String chatPartnerName;

  const ChatScreen({super.key, required this.chatPartnerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatPartnerName),
        backgroundColor: Colors.blueGrey,
      ),
      body: const Center(
        child: Text(
          "This is the chat screen!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}