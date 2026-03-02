class AppStrings {
  static const String onboardingOneTitle = "Scan. Done.";
  static const String onboardingOneBody =
      "Snap your receipt and let AI capture every item in seconds.";

  // Onboarding 2: Itemized Splitting
  static const String onboardingTwoTitle = "Assign What You Ate";
  static const String onboardingTwoBody =
      "Tap items to friends so everyone pays only their true share.";

  // Onboarding 3: Supabase Sync
  static const String onboardingThreeTitle = "Settle in One View";
  static const String onboardingThreeBody =
      "See balances update live and settle quickly with your preferred app.";

  // --- Authentication ---
  static const String authWelcomeTitle = "Ready to make math easy?";
  static const String authChooserTitle = "Join SplitEase";
  static const String authChooserBody =
      "Log in to continue or create an account to start splitting bills.";
  static const String loginButton = "Log In";
  static const String signUpButton = "Create Account";
  static const String loginComingSoon = "Login screen coming soon";
  static const String signupComingSoon = "Sign up screen coming soon";
  static const String googleSignIn = "Continue with Google";
  static const String emailPlaceholder = "Email Address";
  static const String passwordPlaceholder = "Password";
  static const String usernamePlaceholder = "Choose a Username";
  static const String forgotPasswordButton = "Forgot Password?";
  static const String authUnexpectedError =
      "Something went wrong. Please try again.";
  static const String signUpVerifyEmailMessage =
      "Account created. Check your email to verify, then log in.";
  static const String appTitle = "SplitEase";
  static const String authenticatedShellBody =
      "You are logged in successfully. Dashboard integration is next.";
  static const String logoutButton = "Log Out";

  // Startup
  static const String startupLoading = "Checking your account...";

  // Home
  static const String homeHeader = "Hey there!";
  static const String homeWelcomeBody =
      "Welcome back. Your shared expenses are ready to review.";
  static const String homePlaceholderBody =
      "Your home dashboard modules (groups, expenses, settlements) will appear here.";

  // Recovery flow
  static const String forgotPasswordTitle = "Forgot Password";
  static const String forgotPasswordBody =
      "Enter your account email and we will send you a 6-digit verification code.";
  static const String sendCodeButton = "Send Code";
  static const String verifyOtpTitle = "Verify Code";
  static const String verifyOtpBody = "Enter the 6-digit code sent to";
  static const String otpCodeHelper = "Code expires quickly for your security.";
  static const String verifyCodeButton = "Verify Code";
  static const String resendCodeButton = "Resend Code";
  static const String resendingCodeButton = "Resending...";
  static const String otpCodeSentSuccess =
      "A 6-digit code has been sent to your email.";
  static const String otpCodeResentSuccess = "A new code has been sent.";
  static const String newPasswordTitle = "Set New Password";
  static const String newPasswordBody =
      "Create a new password for your account to complete recovery.";
  static const String newPasswordLabel = "New Password";
  static const String newPasswordHint = "Enter your new password";
  static const String confirmPasswordLabel = "Confirm Password";
  static const String confirmPasswordHint = "Re-enter your new password";
  static const String passwordRuleHelper =
      "Use at least 8 characters and make sure both passwords match.";
  static const String resetPasswordButton = "Reset Password";
  static const String passwordResetSuccess =
      "Password updated successfully. You can now log in.";

  // Legacy dashboard labels
  static const String totalOwedToYou = "Owed to you";
  static const String totalYouOwe = "You owe";
  static const String scanNewBill = "Scan New Bill";
  static const String recentActivity = "Recent Activity";

  // --- OCR & Splitting Logic ---
  static const String scannerPrompt = "Align receipt within the frame";
  static const String ocrReviewTitle = "Check the math";
  static const String ocrReviewSub =
      "We found these items. Tap any line to fix typos.";
  static const String participantTitle = "Who's splitting?";
  static const String splitterInstruction = "Tap an item, then tap a friend";
  static const String taxTipTitle = "Don't forget the extras";
  static const String proportionalToggle = "Split Tax/Tip Proportionally";

  // --- Settlement & Success ---
  static const String finalSummaryTitle = "All set!";
  static const String confirmRequest = "Confirm & Request";
  static const String settleUpTitle = "Settle Up";
  static const String markAsPaid = "Mark as Paid (Cash)";
  static const String payViaVenmo = "Pay via Venmo";

  // --- Error & Edge Cases ---
  static const String ocrError =
      "We couldn't read that price. Please enter it manually.";
  static const String networkError =
      "Connection lost. We'll sync with Supabase once you're back online.";
}
