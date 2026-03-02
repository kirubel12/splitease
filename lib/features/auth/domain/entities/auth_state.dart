import 'package:splitease/features/auth/domain/entities/auth_user.dart';

class AuthState {
  const AuthState._({
    required this.user,
    required this.isAuthenticated,
  });

  const AuthState.unauthenticated()
      : this._(
          user: null,
          isAuthenticated: false,
        );

  const AuthState.authenticated(AuthUser user)
      : this._(
          user: user,
          isAuthenticated: true,
        );

  final AuthUser? user;
  final bool isAuthenticated;
}
