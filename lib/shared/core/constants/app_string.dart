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
  static const String loginButton = "Log In";
  static const String signUpButton = "Create Account";
  static const String googleSignIn = "Continue with Google";
  static const String emailPlaceholder = "Email Address";
  static const String passwordPlaceholder = "Password";
  static const String usernamePlaceholder = "Choose a Username";

  // --- Home / Dashboard ---
  static const String homeHeader = "Hey there!";
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
