import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:splitease/features/auth/domain/repositories/auth_repository.dart';
import 'package:splitease/features/auth/presentation/providers/auth_provider.dart';
import 'package:splitease/features/auth/presentation/utils/auth_validators.dart';
import 'package:splitease/features/auth/presentation/views/login_view.dart';
import 'package:splitease/shared/core/constants/app_string.dart';
import 'package:splitease/shared/ui/widgets/app_text_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  static const routeName = '/signup';

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  bool get _isFormValid =>
      AuthValidators.validateUsername(_usernameController.text) == null &&
      AuthValidators.validateEmail(_emailController.text) == null &&
      AuthValidators.validatePassword(_passwordController.text) == null;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    try {
      await ref.read(authControllerProvider.notifier).signUp(
            username: _usernameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.signUpVerifyEmailMessage)),
      );

      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const LoginView()),
      );
    } on AuthFailure {
      // Error snackbars are handled by provider listener below.
    }
  }

  void _goToLogin() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(builder: (_) => const LoginView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    ref.listen<AsyncValue>(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          final message = error is AuthFailure
              ? error.message
              : AppStrings.authUnexpectedError;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
        },
      );
    });

    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;
    final canSubmit = _isFormValid && !isLoading;

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
              Text('Create Account', style: theme.textTheme.headlineLarge),
              const SizedBox(height: 8),
              Text(
                'Join SplitEase to start managing shared expenses effortlessly.',
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 48),
              AppTextField(
                controller: _usernameController,
                label: AppStrings.usernamePlaceholder,
                hint: 'Choose a username',
                prefixIcon: Icons.person_outline,
                validator: AuthValidators.validateUsername,
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _emailController,
                label: AppStrings.emailPlaceholder,
                hint: 'Enter your email',
                prefixIcon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: AuthValidators.validateEmail,
              ),
              const SizedBox(height: 24),
              AppTextField(
                controller: _passwordController,
                label: AppStrings.passwordPlaceholder,
                hint: 'Create a password',
                prefixIcon: Icons.lock_outline,
                obscureText: _obscurePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  tooltip: _obscurePassword ? 'Show password' : 'Hide password',
                ),
                validator: AuthValidators.validatePassword,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: canSubmit ? _submit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: canSubmit
                      ? theme.colorScheme.primary
                      : theme.colorScheme.surfaceContainerHighest,
                  foregroundColor: canSubmit
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onSurfaceVariant,
                  disabledBackgroundColor:
                      theme.colorScheme.surfaceContainerHighest,
                  disabledForegroundColor: theme.colorScheme.onSurfaceVariant,
                  minimumSize: const Size.fromHeight(56),
                  elevation: canSubmit ? 2 : 0,
                ),
                child: isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: canSubmit
                              ? theme.colorScheme.onPrimary
                              : theme.colorScheme.onSurfaceVariant,
                        ),
                      )
                    : const Text('Sign Up'),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: theme.textTheme.bodyMedium,
                  ),
                  TextButton(
                    onPressed: _goToLogin,
                    child: const Text(AppStrings.loginButton),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
