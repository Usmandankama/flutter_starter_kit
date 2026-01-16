import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController extends GetxController {
  final Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  String get userName => _firebaseUser.value?.displayName ?? "Guest";
  String get userEmail => _firebaseUser.value?.email ?? "";
  String get userPhoto => _firebaseUser.value?.photoURL ?? "";

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(FirebaseAuth.instance.authStateChanges());
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    _firebaseUser.value = null;
  }
}
