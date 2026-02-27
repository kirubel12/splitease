library;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

export 'app_colors.dart';

const _brandSeed = Color(0xFF10B981);
const _lightBackground = Color(0xFFF3FCF8);
const _lightSurface = Color(0xFFFFFFFF);
const _darkBackground = Color(0xFF061510);
const _darkSurface = Color(0xFF0B1F18);

ThemeData get lightTheme => _buildTheme(Brightness.light);
ThemeData get darkTheme => _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  final baseScheme = ColorScheme.fromSeed(
    seedColor: _brandSeed,
    brightness: brightness,
  );

  final colorScheme = baseScheme.copyWith(
    surface: isDark ? _darkSurface : _lightSurface,
    surfaceContainerHighest: isDark ? const Color(0xFF113127) : const Color(0xFFE5F7EF),
    outline: isDark ? const Color(0xFF1C4A3B) : const Color(0xFFBFE8D8),
    outlineVariant: isDark ? const Color(0xFF163B30) : const Color(0xFFD8F1E8),
  );

  final textTheme = GoogleFonts.manropeTextTheme(
    ThemeData(brightness: brightness).textTheme,
  ).copyWith(
    titleLarge: GoogleFonts.manrope(
      fontSize: 22,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      color: colorScheme.onSurface,
    ),
    titleMedium: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: colorScheme.onSurface,
    ),
    bodyLarge: GoogleFonts.manrope(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    bodyMedium: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: colorScheme.onSurface,
    ),
    labelLarge: GoogleFonts.manrope(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      letterSpacing: 0.2,
      color: colorScheme.onSurface,
    ),
  );

  final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: isDark ? _darkBackground : _lightBackground,
    textTheme: textTheme,

    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme.onSurface,
      titleTextStyle: textTheme.titleLarge,
    ),

    cardTheme: CardThemeData(
      color: colorScheme.surface,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: shape.copyWith(
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: textTheme.labelLarge,
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        textStyle: textTheme.labelLarge,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: textTheme.labelLarge,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDark ? const Color(0xFF0F2A20) : const Color(0xFFEFFAF4),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      hintStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
      labelStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colorScheme.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colorScheme.outlineVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colorScheme.error),
      ),
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      elevation: 0,
      height: 72,
      indicatorColor: colorScheme.primaryContainer,
      labelTextStyle: WidgetStatePropertyAll(textTheme.labelMedium),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      selectedLabelStyle: textTheme.labelSmall,
      unselectedLabelStyle: textTheme.labelSmall,
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      highlightElevation: 0,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: isDark ? const Color(0xFF113127) : const Color(0xFFE5F7EF),
      selectedColor: colorScheme.primaryContainer,
      side: BorderSide.none,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      labelStyle: textTheme.labelMedium!,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      iconColor: colorScheme.onSurfaceVariant,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      titleTextStyle: textTheme.bodyLarge,
      subtitleTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
    ),

    dividerTheme: DividerThemeData(
      color: colorScheme.outlineVariant,
      thickness: 1,
      space: 1,
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.primaryContainer,
      circularTrackColor: colorScheme.primaryContainer,
    ),

    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: isDark ? const Color(0xFF113127) : const Color(0xFF0D2E24),
      contentTextStyle: textTheme.bodyMedium?.copyWith(color: Colors.white),
      actionTextColor: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ),
  );
}
