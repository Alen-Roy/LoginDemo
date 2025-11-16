import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindemoapp/featuers/auth/domain/entities/app_user.dart';
import 'package:logindemoapp/featuers/auth/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> deleteAccount() async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) throw Exception("No user loged in...");
      await user.delete();
      await logOut();
    } catch (e) {
      throw Exception("Failed to delete account: $e");
    }
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }

  @override
  Future<void> logOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw Exception("Error failed to logOut $e");
    }
  }

  @override
  Future<AppUser?> logininWithEmailPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);
      return user;
    } catch (e) {
      throw Exception("Login failed $e");
    }
  }

  @override
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(uid: userCredential.user!.uid, email: email);
      return user;
    } catch (e) {
      throw Exception("Login failed $e");
    }
  }

  @override
  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Password reset email! Check your inbox";
    } catch (e) {
      return "an error occured $e";
    }
  }
}
