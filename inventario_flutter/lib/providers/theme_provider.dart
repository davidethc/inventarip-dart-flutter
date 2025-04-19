import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF0288D1), // Modern blue
      secondary: const Color(0xFF6200EA), // Vibrant purple
      background: const Color(0xFFF8F9FC), // Soft white-blue
      surface: Colors.white,
      error: const Color(0xFFE91E63), // Modern pink
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: const Color(0xFF2C3E50),
      onSurface: const Color(0xFF2C3E50),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: const Color(0xFF0288D1).withOpacity(0.2),
          width: 1,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      foregroundColor: Color(0xFF2C3E50),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F9FC),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF00BCD4), // Cyan futuristic
      secondary: const Color(0xFF7C4DFF), // Deep space blue
      surface: const Color(0xFF252941), // Midnight blue
      error: const Color(0xFFFF2E63), // Neon pink
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: const Color(0xFFE0E0E0),
      onSurface: Colors.white,
    ),
    cardTheme: CardTheme(
      color: const Color(0xFF252941), // Midnight blue
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: Color(0xFF00BCD4), // Cyan border
          width: 1,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A2E),
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFF1A1A2E),
  );
}
