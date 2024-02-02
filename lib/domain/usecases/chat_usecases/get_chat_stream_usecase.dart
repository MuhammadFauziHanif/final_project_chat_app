import 'package:cloud_firestore/cloud_firestore.dart';

class GetChatStreamUseCase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> execute() {
    return _firestore
        .collection('chat')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }
}
