import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  Stream<QuerySnapshot<Map<String, dynamic>>> getChatStream() {
    return _firestore
        .collection('chat')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  Future<void> sendMessage(
      String text, String userImage, String username, String? imageUrl) async {
    final user = _auth.currentUser;
    final userData = await _firestore.collection('users').doc(user!.uid).get();

    await _firestore.collection('chat').add({
      'text': text,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': username,
      'userImage': userImage,
      'image': imageUrl,
    });
  }
}
