import 'package:flutter/material.dart';
import 'package:splitease/features/auth/data/services/auth_recovery_service.dart';
import 'package:splitease/features/auth/presentation/models/password_reset_args.dart';
import 'package:splitease/features/auth/presentation/utils/auth_validators.dart';
import 'package:splitease/features/auth/presentation/views/otp_verification_view.dart';
import 'package:splitease/shared/core/constants/app_string.dart';
import 'package:splitease/shared/ui/widgets/app_text_field.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  static const routeName = '/forgot-password';

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _recoveryService = const AuthRecoveryService();

  bool _isSubmitting = false;

  bool get _isFormValid => AuthValidators.validateEmail(_emailController.text) == null;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2 || parts.first.length < 2) {
      return email;
    }

    final local = parts.first;
    final maskedLocal = '${local.substring(0, 2)}***';
    return '$maskedLocal@${parts.last}';
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid || _isSubmitting) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    final email = _emailController.text.trim();

    try {
      await _recoveryService.requestPasswordResetOtp(email: email);

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.otpCodeSentSuccess)),
      );

      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (_) => OtpVerificationView(
            args: PasswordResetArgs(email: email),
          ),
        ),
      );
    } on AuthRecoveryException catch (error) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.message)));
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final canSubmit = _isFormValid && !_isSubmitting;
    final masked = _isFormValid ? _maskEmail(_emailController.text.trim()) : 'your email address';

    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () => setState(() {}),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(AppStrings.forgotPasswordTitle, style: theme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text(
                AppStrings.forgotPasswordBody,
                style: theme.textTheme.bodyLarge?.copyWith(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 40),
              AppTextField(
                controller: _emailController,
                label: AppStrings.emailPlaceholder,
                hint: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: AuthValidators.validateEmail,
              ),
              const SizedBox(height: 12),
              Text(
                'We will send a 6-digit code to $masked.',
                style: theme.textTheme.bodyMedium?.copyWith(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: canSubmit ? _submit : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: canSubmit ? colors.primary : colors.surfaceContainerHighest,
                  foregroundColor: canSubmit ? colors.onPrimary : colors.onSurfaceVariant,
                  disabledBackgroundColor: colors.surfaceContainerHighest,
                  disabledForegroundColor: colors.onSurfaceVariant,
                ),
                child: _isSubmitting
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: canSubmit ? colors.onPrimary : colors.onSurfaceVariant,
                        ),
                      )
                    : const Text(AppStrings.sendCodeButton),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
