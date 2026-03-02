import 'package:flutter/material.dart';
import 'package:splitease/features/auth/data/services/auth_recovery_service.dart';
import 'package:splitease/features/auth/presentation/models/password_reset_args.dart';
import 'package:splitease/features/auth/presentation/utils/auth_validators.dart';
import 'package:splitease/features/auth/presentation/views/login_view.dart';
import 'package:splitease/shared/core/constants/app_string.dart';
import 'package:splitease/shared/ui/widgets/app_text_field.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({
    required this.args,
    super.key,
  });

  static const routeName = '/new-password';

  final PasswordResetArgs args;

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _recoveryService = const AuthRecoveryService();

  bool _isSubmitting = false;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  bool get _isFormValid =>
      AuthValidators.validateNewPassword(_newPasswordController.text) == null &&
      AuthValidators.validateConfirmPassword(
            _confirmPasswordController.text,
            _newPasswordController.text,
          ) ==
          null;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid || _isSubmitting) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await _recoveryService.updatePassword(newPassword: _newPasswordController.text.trim());

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.passwordResetSuccess)),
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (_) => const LoginView()),
        (route) => false,
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
              Text(AppStrings.newPasswordTitle, style: theme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text(
                AppStrings.newPasswordBody,
                style: theme.textTheme.bodyLarge?.copyWith(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 40),
              AppTextField(
                controller: _newPasswordController,
                label: AppStrings.newPasswordLabel,
                hint: AppStrings.newPasswordHint,
                prefixIcon: Icons.lock_outline,
                obscureText: _obscureNewPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureNewPassword = !_obscureNewPassword;
                    });
                  },
                  icon: Icon(
                    _obscureNewPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  tooltip: _obscureNewPassword ? 'Show password' : 'Hide password',
                ),
                validator: AuthValidators.validateNewPassword,
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _confirmPasswordController,
                label: AppStrings.confirmPasswordLabel,
                hint: AppStrings.confirmPasswordHint,
                prefixIcon: Icons.lock_reset_outlined,
                obscureText: _obscureConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  icon: Icon(
                    _obscureConfirmPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  tooltip: _obscureConfirmPassword ? 'Show password' : 'Hide password',
                ),
                validator: (value) => AuthValidators.validateConfirmPassword(
                  value,
                  _newPasswordController.text,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppStrings.passwordRuleHelper,
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
                    : const Text(AppStrings.resetPasswordButton),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
