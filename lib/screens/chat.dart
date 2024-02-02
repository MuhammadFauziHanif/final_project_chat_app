//chat.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/widgets/chat_message.dart';
import 'package:firebase_project/widgets/new_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text('FlutterChat'),
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatMessages(),
          ),
          const NewMessage(),
        ],
      ),
    );
  }
}
