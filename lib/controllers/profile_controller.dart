// import 'dart:io';
// import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ProfileController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> updateDisplayName(String name) async {
//     try {
//       await _auth.currentUser?.updateDisplayName(name);
//       await _auth.currentUser?.reload();
//     } catch (e) {
//       Get.snackbar("Error", "Could not update name: $e");
//     }
//   }

//   Future<void> updateProfileImage(File imageFile) async {
//     try {
//       final uid = _auth.currentUser?.uid;
//       if (uid == null) return;

//       final ref = _storage.ref().child('profile_images/$uid.jpg');
//       await ref.putFile(imageFile);
//       final imageUrl = await ref.getDownloadURL();

//       await _auth.currentUser?.updatePhotoURL(imageUrl);
//       await _auth.currentUser?.reload();
//     } catch (e) {
//       Get.snackbar("Error", "Failed to upload image: $e");
//     }
//   }
// }
