import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isAmoledMode = false;

  ThemeMode get themeMode => _themeMode;
  bool get isAmoledMode => _isAmoledMode;

  bool get isDarkMode {
    return _themeMode == ThemeMode.dark;
  }

  bool get isLightMode {
    return _themeMode == ThemeMode.light;
  }

  bool get isSystemMode {
    return _themeMode == ThemeMode.system;
  }

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }
    notifyListeners();
  }

  void setLightMode() {
    _themeMode = ThemeMode.light;
    notifyListeners();
  }

  void setDarkMode() {
    _themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setSystemMode() {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }

  void toggleAmoledMode() {
    _isAmoledMode = !_isAmoledMode;
    notifyListeners();
  }

  void setAmoledMode(bool enabled) {
    _isAmoledMode = enabled;
    notifyListeners();
  }

  // Get the appropriate dark theme based on AMOLED setting
  ThemeData getDarkTheme() {
    if (_isAmoledMode) {
      return _buildAmoledTheme();
    } else {
      return _buildDarkTheme();
    }
  }

  // Regular dark theme
  ThemeData _buildDarkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E),
        iconTheme: IconThemeData(
          color: Colors.blue
        )
      ),
    );
  }

  // Pure black AMOLED theme
  ThemeData _buildAmoledTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      cardColor: const Color(0xFF0A0A0A),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.blue
        )
      ),
      canvasColor: Colors.black,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black,
      ), dialogTheme: DialogThemeData(backgroundColor: const Color(0xFF0A0A0A)),
    );
  }
}