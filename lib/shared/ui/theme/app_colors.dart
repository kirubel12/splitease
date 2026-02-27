import 'package:flutter/material.dart';

/// Centralised colour palette for SplitEase.
///
/// Emerald green is used as the primary brand colour.
/// All raw colour values live here; themes reference these constants.
abstract final class AppColors {
  // ── Emerald primary ──────────────────────────────────────────────
  static const emerald50 = Color(0xFFECFDF5);
  static const emerald100 = Color(0xFFD1FAE5);
  static const emerald200 = Color(0xFFA7F3D0);
  static const emerald300 = Color(0xFF6EE7B7);
  static const emerald400 = Color(0xFF34D399);
  static const emerald500 = Color(0xFF10B981); // ← brand primary
  static const emerald600 = Color(0xFF059669);
  static const emerald700 = Color(0xFF047857);
  static const emerald800 = Color(0xFF065F46);
  static const emerald900 = Color(0xFF064E3B);

  // ── Neutrals ─────────────────────────────────────────────────────
  static const neutral50 = Color(0xFFFAFAFA);
  static const neutral100 = Color(0xFFF5F5F5);
  static const neutral200 = Color(0xFFE5E5E5);
  static const neutral300 = Color(0xFFD4D4D4);
  static const neutral400 = Color(0xFFA3A3A3);
  static const neutral500 = Color(0xFF737373);
  static const neutral600 = Color(0xFF525252);
  static const neutral700 = Color(0xFF404040);
  static const neutral800 = Color(0xFF262626);
  static const neutral900 = Color(0xFF171717);
  static const neutral950 = Color(0xFF0A0A0A);

  // ── Semantic ─────────────────────────────────────────────────────
  static const error = Color(0xFFEF4444);
  static const errorContainer = Color(0xFFFFEDED);
  static const warning = Color(0xFFF59E0B);
  static const warningContainer = Color(0xFFFEF3C7);
  static const success = emerald500;
  static const successContainer = emerald50;
  static const info = Color(0xFF3B82F6);
  static const infoContainer = Color(0xFFEFF6FF);

  // ── Shared ───────────────────────────────────────────────────────
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const transparent = Color(0x00000000);
}
