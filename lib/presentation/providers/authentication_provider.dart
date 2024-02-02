import 'package:firebase_project/domain/usecases/auth_usecases/sign_in_usecase.dart';
import 'package:firebase_project/domain/usecases/auth_usecases/sign_in_with_google_usecase.dart';
import 'package:firebase_project/domain/usecases/auth_usecases/sign_out_usecase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SignInUseCase _signInUseCase = SignInUseCase();
  final SignInWithGoogleUseCase _signInWithGoogleUseCase =
      SignInWithGoogleUseCase();
  final SignOutUseCase _signOutUseCase = SignOutUseCase();

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _signInUseCase.execute(email, password);
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      // Handle errors
      print("Error during sign in: ${error.message}");
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _signInWithGoogleUseCase.execute();
      notifyListeners();
    } catch (error) {
      // Handle errors
      print("Error during Google sign in: $error");
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (error) {
      // Handle errors
      throw error;
    }
  }

  Future<void> signOut() async {
    await _signOutUseCase.execute();
    notifyListeners();
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  bool get isAuthenticated => _firebaseAuth.currentUser != null;
}
