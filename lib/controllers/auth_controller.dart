import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Rx<User?> firebaseUser = Rx<User?>(null);

  @override
  void onReady() {
    super.onReady();
    firebaseUser.bindStream(_auth.authStateChanges());
  }

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'name': name,
          'email': email,
          'createdAt': FieldValue.serverTimestamp(),
        });

        Get.snackbar("Success", "Account created successfully");

        // Navigate to the login page
        Get.offAllNamed('/login');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
    required String username,
  }) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Update name in Firestore
        await _firestore.collection('users').doc(user.uid).update({
          'name': name,
          'email': email,
          'username': username,
        });

        // Update email in FirebaseAuth (if changed)
        if (user.email != email) {
          await user.updateEmail(email);
        }

        // Update the username in Firebase Authentication if necessary
        // Firebase Authentication doesn't have a direct "username" field, so it would need to be handled separately if desired

        // Show success message
        Get.snackbar("Success", "Profile updated successfully!");
      }
    } catch (e) {
      // Show error message if update fails
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Logged in successfully");
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Start the sign-in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // User canceled the sign-in

      // Get the authentication details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final userCredential = await _auth.signInWithCredential(credential);

      // OPTIONAL: If you're using Firestore, save user info to Firestore here
      // await saveUserToFirestore(userCredential.user);

      // OPTIONAL: Handle local state or navigation after login
      // Get.offAllNamed('/home');

      return userCredential;
    } catch (e, stackTrace) {
      debugPrint("Google Sign-In Error: $e");
      debugPrint("StackTrace: $stackTrace");

      // You could show a dialog/snackbar here
      // Get.snackbar("Login Failed", "Unable to sign in with Google");

      return null;
    }
  }

  Future<void> signOut() async {
    Get.defaultDialog(
      title: "Confirm Sign Out",
      middleText: "Are you sure you want to sign out?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        await _googleSignIn.signOut();
        await _auth.signOut();
        Get.offAllNamed('/login'); // Navigate to login page
      },
    );
  }
}
