class PasswordResetArgs {
  const PasswordResetArgs({
    required this.email,
    this.challengeId,
  });

  final String email;
  final String? challengeId;
}
