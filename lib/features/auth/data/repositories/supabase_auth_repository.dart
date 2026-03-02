import 'package:splitease/features/auth/data/mappers/auth_user_mapper.dart';
import 'package:splitease/features/auth/data/models/auth_user_model.dart';
import 'package:splitease/features/auth/domain/entities/auth_user.dart';
import 'package:splitease/features/auth/domain/repositories/auth_repository.dart';
import 'package:splitease/shared/core/utils/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show AuthException;

class SupabaseAuthRepository implements AuthRepository {
  const SupabaseAuthRepository();

  @override
  AuthUser? currentUser() {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return null;
    }
    return AuthUserModel.fromSupabase(user).toDomain();
  }

  @override
  Future<AuthActionResult> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );

      final user = response.user;
      if (user == null) {
        throw const AuthFailure('Login failed. Please try again.');
      }

      return AuthActionResult(
        user: AuthUserModel.fromSupabase(user).toDomain(),
        hasSession: response.session != null,
      );
    } on AuthFailure {
      rethrow;
    } on AuthException catch (error) {
      throw AuthFailure(_mapAuthError(error));
    } catch (_) {
      throw const AuthFailure('Something went wrong. Please try again.');
    }
  }

  @override
  Future<AuthActionResult> signUpWithEmailPassword({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabase.auth.signUp(
        email: email.trim(),
        password: password,
        data: {'username': username.trim()},
      );

      final user = response.user;
      if (user == null) {
        throw const AuthFailure('Sign up failed. Please try again.');
      }

      return AuthActionResult(
        user: AuthUserModel.fromSupabase(user).toDomain(),
        hasSession: response.session != null,
      );
    } on AuthFailure {
      rethrow;
    } on AuthException catch (error) {
      throw AuthFailure(_mapAuthError(error));
    } catch (_) {
      throw const AuthFailure('Something went wrong. Please try again.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
    } on AuthException catch (error) {
      throw AuthFailure(_mapAuthError(error));
    } catch (_) {
      throw const AuthFailure('Unable to logout right now. Please try again.');
    }
  }

  String _mapAuthError(AuthException error) {
    final message = error.message.toLowerCase();

    if (message.contains('invalid login credentials')) {
      return 'Invalid email or password.';
    }
    if (message.contains('email not confirmed')) {
      return 'Please verify your email before logging in.';
    }
    if (message.contains('network') || message.contains('socket')) {
      return 'No internet connection. Check your network and try again.';
    }
    if (message.contains('rate limit')) {
      return 'Too many attempts. Please wait and try again.';
    }

    return error.message;
  }
}
