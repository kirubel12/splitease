import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Dark [ThemeData] for SplitEase.
///
/// Palette  : Emerald primary on dark neutral surfaces.
/// Typography: Manrope (Google Fonts).
/// Style    : Clean, minimalistic Material 3.
ThemeData get darkTheme {
  const colorScheme = ColorScheme(
    brightness: Brightness.dark,

    // Primary – Emerald (slightly lighter for dark bg contrast)
    primary: AppColors.emerald400,
    onPrimary: AppColors.neutral950,
    primaryContainer: AppColors.emerald800,
    onPrimaryContainer: AppColors.emerald100,

    // Secondary
    secondary: AppColors.emerald300,
    onSecondary: AppColors.neutral950,
    secondaryContainer: AppColors.emerald900,
    onSecondaryContainer: AppColors.emerald100,

    // Tertiary
    tertiary: AppColors.neutral400,
    onTertiary: AppColors.neutral950,
    tertiaryContainer: AppColors.neutral800,
    onTertiaryContainer: AppColors.neutral100,

    // Error
    error: Color(0xFFF87171),
    onError: AppColors.neutral950,
    errorContainer: Color(0xFF7F1D1D),
    onErrorContainer: Color(0xFFFECACA),

    // Surfaces – layered dark neutrals
    surface: AppColors.neutral950,
    onSurface: AppColors.neutral50,
    surfaceContainerHighest: AppColors.neutral800,
    onSurfaceVariant: AppColors.neutral400,

    // Outline
    outline: AppColors.neutral700,
    outlineVariant: AppColors.neutral800,

    // Inverse
    inverseSurface: AppColors.neutral100,
    onInverseSurface: AppColors.neutral900,
    inversePrimary: AppColors.emerald600,

    // Shadow / scrim
    shadow: AppColors.black,
    scrim: AppColors.black,
  );

  final textTheme = _buildDarkTextTheme(colorScheme);

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.neutral950,

    // ── AppBar ────────────────────────────────────────────────────
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.neutral950,
      foregroundColor: AppColors.neutral50,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: AppColors.neutral50,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: AppColors.neutral300),
    ),

    // ── Card ──────────────────────────────────────────────────────
    cardTheme: CardThemeData(
      color: AppColors.neutral900,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.neutral800),
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
        foregroundColor: AppColors.emerald400,
        side: const BorderSide(color: AppColors.emerald500),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    // ── Text Button ───────────────────────────────────────────────
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.emerald400,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),

    // ── Input Decoration ─────────────────────────────────────────
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.neutral900,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.neutral800),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.emerald400, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFF87171)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFF87171), width: 1.5),
      ),
      hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.neutral600),
      labelStyle: textTheme.bodyMedium?.copyWith(color: AppColors.neutral400),
    ),

    // ── Bottom Nav Bar ────────────────────────────────────────────
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.neutral950,
      selectedItemColor: AppColors.emerald400,
      unselectedItemColor: AppColors.neutral600,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
    ),

    // ── Chip ─────────────────────────────────────────────────────
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.neutral800,
      selectedColor: AppColors.emerald900,
      labelStyle: textTheme.labelMedium,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),

    // ── Divider ──────────────────────────────────────────────────
    dividerTheme: const DividerThemeData(
      color: AppColors.neutral800,
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
      iconColor: AppColors.neutral400,
      titleTextStyle: textTheme.bodyLarge?.copyWith(
        color: AppColors.neutral50,
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
        if (states.contains(WidgetState.selected)) return AppColors.neutral950;
        return AppColors.neutral600;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.emerald400;
        return AppColors.neutral800;
      }),
    ),

    // ── Progress Indicator ────────────────────────────────────────
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.emerald400,
      linearTrackColor: AppColors.emerald900,
      circularTrackColor: AppColors.emerald900,
    ),

    // ── Snack Bar ─────────────────────────────────────────────────
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.neutral800,
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: AppColors.neutral50,
      ),
      actionTextColor: AppColors.emerald400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

/// Builds a Manrope-based [TextTheme] for dark surfaces.
TextTheme _buildDarkTextTheme(ColorScheme colorScheme) {
  final base = GoogleFonts.manropeTextTheme(ThemeData.dark().textTheme);
  final onSurface = colorScheme.onSurface;
  final onSurfaceVariant = colorScheme.onSurfaceVariant;

  return base.copyWith(
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
