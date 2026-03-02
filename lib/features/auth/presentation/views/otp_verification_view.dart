import 'dart:async';

import 'package:flutter/material.dart';
import 'package:splitease/features/auth/data/services/auth_recovery_service.dart';
import 'package:splitease/features/auth/presentation/models/password_reset_args.dart';
import 'package:splitease/features/auth/presentation/utils/auth_validators.dart';
import 'package:splitease/features/auth/presentation/views/new_password_view.dart';
import 'package:splitease/features/auth/presentation/widgets/otp_pin_input.dart';
import 'package:splitease/shared/core/constants/app_string.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({required this.args, super.key});

  static const routeName = '/verify-otp';

  final PasswordResetArgs args;

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final _recoveryService = const AuthRecoveryService();

  Timer? _timer;
  String _otpCode = '';
  bool _isSubmitting = false;
  bool _isResending = false;
  int _secondsRemaining = 30;

  bool get _canVerify =>
      AuthValidators.validateOtp6(_otpCode) == null && !_isSubmitting;

  @override
  void initState() {
    super.initState();
    _startCooldown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2 || parts.first.length < 2) {
      return email;
    }

    final local = parts.first;
    return '${local.substring(0, 2)}***@${parts.last}';
  }

  void _startCooldown() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 60;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        return;
      }
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _secondsRemaining -= 1;
      });
    });
  }

  Future<void> _verifyCode() async {
    if (!_canVerify) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await _recoveryService.verifyPasswordResetOtp(
        email: widget.args.email,
        otpCode: _otpCode,
      );

      if (!mounted) {
        return;
      }

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => NewPasswordView(args: widget.args),
        ),
      );
    } on AuthRecoveryException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _resendCode() async {
    if (_secondsRemaining > 0 || _isResending) {
      return;
    }

    setState(() {
      _isResending = true;
    });

    try {
      await _recoveryService.resendPasswordResetOtp(email: widget.args.email);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.otpCodeResentSuccess)),
      );
      _startCooldown();
    } on AuthRecoveryException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(error.message)));
    } finally {
      if (mounted) {
        setState(() {
          _isResending = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              AppStrings.verifyOtpTitle,
              style: theme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              '${AppStrings.verifyOtpBody} ${_maskEmail(widget.args.email)}',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),
            OtpPinInput(
              enabled: !_isSubmitting,
              onChanged: (code) {
                setState(() {
                  _otpCode = code;
                });
              },
            ),
            const SizedBox(height: 12),
            Text(
              AppStrings.otpCodeHelper,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _canVerify ? _verifyCode : null,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
                elevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: _canVerify
                    ? colors.primary
                    : colors.surfaceContainerHighest,
                foregroundColor: _canVerify
                    ? colors.onPrimary
                    : colors.onSurfaceVariant,
                disabledBackgroundColor: colors.surfaceContainerHighest,
                disabledForegroundColor: colors.onSurfaceVariant,
              ),
              child: _isSubmitting
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.2,
                        color: _canVerify
                            ? colors.onPrimary
                            : colors.onSurfaceVariant,
                      ),
                    )
                  : const Text(AppStrings.verifyCodeButton),
            ),
            const SizedBox(height: 20),
            Center(
              child: _secondsRemaining > 0
                  ? Text(
                      'Resend code in ${_secondsRemaining}s',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    )
                  : TextButton(
                      onPressed: _isResending ? null : _resendCode,
                      child: _isResending
                          ? const Text(AppStrings.resendingCodeButton)
                          : const Text(AppStrings.resendCodeButton),
                    ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
