import 'package:firebase_project/domain/usecases/chat_usecases/get_chat_stream_usecase.dart';
import 'package:firebase_project/domain/usecases/chat_usecases/send_message_usecase.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GetChatStreamUseCase _getChatStreamUseCase = GetChatStreamUseCase();
  final SendMessageUseCase _sendMessageUseCase = SendMessageUseCase();

  User? get currentUser => _auth.currentUser;

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatStream() {
    return _getChatStreamUseCase.execute();
  }

  Future<void> sendMessage(
      String text, String userImage, String username, String? imageUrl) async {
    await _sendMessageUseCase.execute(text, userImage, username, imageUrl);
  }
}
