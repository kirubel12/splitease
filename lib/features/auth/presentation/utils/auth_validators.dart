class AuthValidators {
  const AuthValidators._();

  static final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static final RegExp _otpRegex = RegExp(r'^\d{6}$');

  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Email is required';
    }
    if (!_emailRegex.hasMatch(email)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validateUsername(String? value) {
    final username = value?.trim() ?? '';
    if (username.isEmpty) {
      return 'Username is required';
    }
    if (username.length < 3) {
      return 'Username must be at least 3 characters';
    }
    return null;
  }

  static String? validateOtp6(String? value) {
    final otp = value?.trim() ?? '';
    if (otp.isEmpty) {
      return 'Code is required';
    }
    if (!_otpRegex.hasMatch(otp)) {
      return 'Enter the 6-digit code';
    }
    return null;
  }

  static String? validateNewPassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) {
      return 'New password is required';
    }
    if (password.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String newPassword) {
    final confirm = value ?? '';
    if (confirm.isEmpty) {
      return 'Please confirm your new password';
    }
    if (confirm != newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }
}
