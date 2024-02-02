//chat.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/presentation/providers/authentication_provider.dart';
import 'package:firebase_project/presentation/widgets/chat_message.dart';
import 'package:firebase_project/presentation/widgets/new_message.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .signOut();
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