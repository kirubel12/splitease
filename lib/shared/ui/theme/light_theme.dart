import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Light [ThemeData] for SplitEase.
///
/// Palette  : Emerald primary on white / neutral-50 surfaces.
/// Typography: Manrope (Google Fonts).
/// Style    : Clean, minimalistic Material 3.
ThemeData get lightTheme {
  const colorScheme = ColorScheme(
    brightness: Brightness.light,

    // Primary – Emerald
    primary: AppColors.emerald500,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.emerald100,
    onPrimaryContainer: AppColors.emerald800,

    // Secondary – muted emerald
    secondary: AppColors.emerald700,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.emerald50,
    onSecondaryContainer: AppColors.emerald900,

    // Tertiary – cool neutral accent
    tertiary: AppColors.neutral600,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.neutral100,
    onTertiaryContainer: AppColors.neutral900,

    // Error
    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.error,

    // Surfaces
    surface: AppColors.white,
    onSurface: AppColors.neutral900,
    surfaceContainerHighest: AppColors.neutral100,
    onSurfaceVariant: AppColors.neutral600,

    // Outline
    outline: AppColors.neutral200,
    outlineVariant: AppColors.neutral100,

    // Inverse
    inverseSurface: AppColors.neutral900,
    onInverseSurface: AppColors.neutral50,
    inversePrimary: AppColors.emerald300,

    // Shadow / scrim
    shadow: AppColors.black,
    scrim: AppColors.black,
  );

  final textTheme = _buildTextTheme(colorScheme);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.neutral50,

    // ── AppBar ────────────────────────────────────────────────────
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.neutral900,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: AppColors.neutral900,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: AppColors.neutral700),
    ),

    // ── Card ──────────────────────────────────────────────────────
    cardTheme: CardThemeData(
      color: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.neutral200),
      ),
      margin: EdgeInsets.zero,
    ),

    // ── Elevated Button ───────────────────────────────────────────
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.emerald500,
        foregroundColor: AppColors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    // ── Outlined Button ───────────────────────────────────────────
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.emerald600,
        side: const BorderSide(color: AppColors.emerald500),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    // ── Text Button ───────────────────────────────────────────────
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.emerald600,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    // ── Input Decoration ─────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.neutral100,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.emerald500, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.error, width: 1.5),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.neutral400),
      labelStyle: textTheme.bodyMedium?.copyWith(color: AppColors.neutral600),
    ),

    // ── Bottom Nav Bar ────────────────────────────────────────────
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.emerald500,
      unselectedItemColor: AppColors.neutral400,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    // ── Chip ─────────────────────────────────────────────────────
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.neutral100,
      selectedColor: AppColors.emerald100,
      labelStyle: textTheme.labelMedium,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),

    // ── Divider ──────────────────────────────────────────────────
    dividerTheme: const DividerThemeData(
      color: AppColors.neutral200,
      thickness: 1,
      space: 1,
    ),

    // ── FAB ──────────────────────────────────────────────────────
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.emerald500,
      foregroundColor: AppColors.white,
      elevation: 2,
      shape: CircleBorder(),
    ),

    // ── List Tile ─────────────────────────────────────────────────
    listTileTheme: ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      iconColor: AppColors.neutral600,
      titleTextStyle: textTheme.bodyLarge?.copyWith(
        color: AppColors.neutral900,
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: textTheme.bodySmall?.copyWith(
        color: AppColors.neutral500,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    // ── Switch ───────────────────────────────────────────────────
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.white;
        return AppColors.neutral400;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.emerald500;
        return AppColors.neutral200;
      }),
    ),

    // ── Progress Indicator ────────────────────────────────────────
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.emerald500,
      linearTrackColor: AppColors.emerald100,
      circularTrackColor: AppColors.emerald100,
    ),

    // ── Snack Bar ─────────────────────────────────────────────────
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.neutral900,
      contentTextStyle: textTheme.bodyMedium?.copyWith(color: AppColors.white),
      actionTextColor: AppColors.emerald400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

/// Builds a Manrope-based [TextTheme] matching the given [ColorScheme].
TextTheme _buildTextTheme(ColorScheme colorScheme) {
  final base = GoogleFonts.manropeTextTheme();
  final onSurface = colorScheme.onSurface;
  final onSurfaceVariant = colorScheme.onSurfaceVariant;

  return base.copyWith(
    // Display
    displayLarge: base.displayLarge?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w700,
      letterSpacing: -1.5,
    ),
    displayMedium: base.displayMedium?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.5,
    ),
    displaySmall: base.displaySmall?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w600,
    ),

    // Headline
    headlineLarge: base.headlineLarge?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: base.headlineMedium?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: base.headlineSmall?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w600,
    ),

    // Title
    titleLarge: base.titleLarge?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: base.titleMedium?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    titleSmall: base.titleSmall?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w500,
    ),

    // Body
    bodyLarge: base.bodyLarge?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: base.bodyMedium?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: base.bodySmall?.copyWith(
      color: onSurfaceVariant,
      fontWeight: FontWeight.w400,
    ),

    // Label
    labelLarge: base.labelLarge?.copyWith(
      color: onSurface,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.1,
    ),
    labelMedium: base.labelMedium?.copyWith(
      color: onSurfaceVariant,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: base.labelSmall?.copyWith(
      color: onSurfaceVariant,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}
