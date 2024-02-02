import 'package:firebase_auth/firebase_auth.dart';

class SignInUseCase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> execute(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (error) {
      // Handle errors
      throw error;
    }
  }
}
