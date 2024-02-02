import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendMessageUseCase {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> execute(
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
