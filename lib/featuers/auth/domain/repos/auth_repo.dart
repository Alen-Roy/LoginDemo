import 'package:logindemoapp/featuers/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> logininWithEmailPassword(String email, String password);
  Future<AppUser?> registerWithEmailPassword(
    String name,
    String email,
    String password,
  );
  Future<void> logOut();
  Future<AppUser?> getCurrentUser();
  Future<String> sendPasswordResetEmail(String email);
  Future<void> deleteAccount();
}
