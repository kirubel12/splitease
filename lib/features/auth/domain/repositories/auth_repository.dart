import 'package:splitease/features/auth/domain/entities/auth_user.dart';

class AuthActionResult {
  const AuthActionResult({
    required this.user,
    required this.hasSession,
  });

  final AuthUser user;
  final bool hasSession;
}

class AuthFailure implements Exception {
  const AuthFailure(this.message);

  final String message;

  @override
  String toString() => message;
}

abstract class AuthRepository {
  Future<AuthActionResult> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<AuthActionResult> signUpWithEmailPassword({
    required String username,
    required String email,
    required String password,
  });

  AuthUser? currentUser();

  Future<void> logout();
}
