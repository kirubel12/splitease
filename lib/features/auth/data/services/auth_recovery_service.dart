import 'package:splitease/shared/core/utils/supabase_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRecoveryException implements Exception {
  const AuthRecoveryException(this.message);

  final String message;

  @override
  String toString() => message;
}

class AuthRecoveryService {
  const AuthRecoveryService();

  Future<void> requestPasswordResetOtp({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email.trim());
    } on AuthException catch (error) {
      throw AuthRecoveryException(_mapAuthError(error));
    } catch (_) {
      throw const AuthRecoveryException(
        'Something went wrong. Please try again.',
      );
    }
  }

  Future<void> resendPasswordResetOtp({required String email}) async {
    try {
      await supabase.auth.resetPasswordForEmail(email.trim());
    } on AuthException catch (error) {
      throw AuthRecoveryException(_mapAuthError(error));
    } catch (_) {
      throw const AuthRecoveryException(
        'Unable to resend code right now. Please try again.',
      );
    }
  }

  Future<void> verifyPasswordResetOtp({
    required String email,
    required String otpCode,
  }) async {
    try {
      final response = await supabase.auth.verifyOTP(
        type: OtpType.recovery,
        email: email.trim(),
        token: otpCode.trim(),
      );

      if (response.session == null) {
        throw const AuthRecoveryException(
          'Verification session was not created. Please request a new code.',
        );
      }
    } on AuthRecoveryException {
      rethrow;
    } on AuthException catch (error) {
      throw AuthRecoveryException(_mapAuthError(error));
    } catch (_) {
      throw const AuthRecoveryException(
        'Unable to verify code right now. Please try again.',
      );
    }
  }

  Future<void> updatePassword({required String newPassword}) async {
    try {
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
    } on AuthException catch (error) {
      throw AuthRecoveryException(_mapAuthError(error));
    } catch (_) {
      throw const AuthRecoveryException(
        'Unable to reset password right now. Please try again.',
      );
    }
  }

  String _mapAuthError(AuthException error) {
    final message = error.message.toLowerCase();

    if (message.contains('rate limit')) {
      return 'Too many attempts. Please wait and try again.';
    }
    if (message.contains('invalid') && message.contains('email')) {
      return 'Please enter a valid email address.';
    }
    if (message.contains('invalid') && message.contains('token')) {
      return 'That code is invalid. Please try again.';
    }
    if (message.contains('expired')) {
      return 'This code has expired. Request a new one.';
    }
    if (message.contains('network') || message.contains('socket')) {
      return 'No internet connection. Check your network and try again.';
    }

    return error.message;
  }
}
