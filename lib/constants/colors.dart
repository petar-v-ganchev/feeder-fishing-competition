import 'package:flutter/material.dart';

/// App color palette based on nature-inspired fishing theme
class AppColors {
  // Primary colors
  static const Color primary = Color(0xFF1B5E20); // Deep forest green
  static const Color primaryLight = Color(0xFF4C8C4A); // Medium green
  static const Color primaryDark = Color(0xFF003300); // Dark green
  
  // Accent colors
  static const Color accent = Color(0xFF0277BD); // Water blue
  static const Color accentLight = Color(0xFF58A5F0); // Light blue
  static const Color accentDark = Color(0xFF004C8C); // Dark blue
  
  // Background colors
  static const Color background = Color(0xFFF5F7F4); // Light green-gray
  static const Color cardBackground = Color(0xFFFFFFFF); // White
  static const Color divider = Color(0xFFE0E0E0); // Light gray
  
  // Text colors
  static const Color textPrimary = Color(0xFF212121); // Near black
  static const Color textSecondary = Color(0xFF757575); // Medium gray
  static const Color textLight = Color(0xFFFFFFFF); // White
  
  // Semantic colors
  static const Color success = Color(0xFF388E3C); // Green
  static const Color error = Color(0xFFD32F2F); // Red
  static const Color warning = Color(0xFFFFA000); // Amber
  static const Color info = Color(0xFF1976D2); // Blue
  
  // Fish species colors
  static const Color carpColor = Color(0xFFCD853F); // Bronze
  static const Color breamColor = Color(0xFF9E9E9E); // Silver
  static const Color carassiusColor = Color(0xFFFFD700); // Gold
  static const Color roachColor = Color(0xFFB71C1C); // Red

  // Material color swatch for primary theme
  static const MaterialColor primarySwatch = MaterialColor(
    0xFF1B5E20,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(0xFF4CAF50),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );
}