// lib/config/app_theme.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pallete.dart';

class AppTheme {
  // Light Theme Data
  static ThemeData get lightTheme {
    Color primaryTextColor = const Color(0xFF3F414E);
    Color secondaryTextColor = const Color(0xFFA1A4B2);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
      primaryColor: Pallete.blue1,
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      primaryColorDark: const Color(0xFF3F414E),
      primaryColorLight: Colors.white,
      dividerTheme: DividerThemeData(color: Colors.grey[100]),
      tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory, // Menonaktifkan ripple
        overlayColor: MaterialStateProperty.all(
            Colors.transparent), // Menonaktifkan hover
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.1),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Pallete.blue1; // Warna tombol saat aktif
          }
          return Colors.red; // Warna tombol saat tidak aktif
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return Pallete.blue1.withOpacity(0.3); // Warna lintasan saat aktif
          }
          return Colors.red.shade100; // Warna lintasan saat tidak aktif
        }),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57, // Display terbesar untuk teks utama atau header besar
          color: primaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          fontSize:
              45, // Display sedang, digunakan untuk header besar namun tidak dominan
          color: primaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        displaySmall: TextStyle(
          fontSize: 36, // Display kecil, untuk sub-header atau judul penting
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontSize: 32, // Ukuran untuk headline atau judul utama
          color: secondaryTextColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 28, // Ukuran headline menengah
          color: primaryTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 24, // Ukuran headline kecil
          color: primaryTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 22, // Ukuran besar untuk judul utama di layar
          color: secondaryTextColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18, // Ukuran sedang untuk judul atau subtitle
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 14, // Ukuran kecil untuk subtitle atau label
          color: secondaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(
          fontSize: 16, // Ukuran teks utama
          color: primaryTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14, // Ukuran teks sekunder
          color: primaryTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12, // Ukuran untuk teks tambahan atau catatan
          color: secondaryTextColor,
        ),
        labelLarge: TextStyle(
          fontSize:
              14, // Label besar, digunakan untuk tombol atau label penting
          color: secondaryTextColor,
        ),
        labelMedium: TextStyle(
          fontSize: 12, // Label sedang untuk UI elemen
          color: secondaryTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Label kecil, digunakan untuk indikator atau ikon
          color: secondaryTextColor,
        ),
      ),
    );
  }

  // Dark Theme Data (Opsional)
  static ThemeData get darkTheme {
    Color primaryTextColor = const Color(0xFFFFFFFF);
    Color secondaryTextColor = const Color(0xFF98A1BD);

    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.abel().fontFamily,
      scaffoldBackgroundColor: const Color(0xFF02174C),
      primaryColor: const Color(0xFF8E97FD),
      primaryColorDark: const Color(0xFFE6E7F2),
      primaryColorLight: Colors.black,
      dividerTheme: DividerThemeData(color: Colors.grey[800]),
      tabBarTheme: TabBarTheme(
        splashFactory: NoSplash.splashFactory, // Menonaktifkan ripple
        overlayColor: MaterialStateProperty.all(
            Colors.transparent), // Menonaktifkan hover
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF02174C),
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF03174D), // Warna background untuk mode gelap
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57, // Display terbesar untuk teks utama atau header besar
          color: primaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        displayMedium: TextStyle(
          fontSize:
              45, // Display sedang, digunakan untuk header besar namun tidak dominan
          color: primaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        displaySmall: TextStyle(
          fontSize: 36, // Display kecil, untuk sub-header atau judul penting
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          fontSize: 32, // Ukuran untuk headline atau judul utama
          color: secondaryTextColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 28, // Ukuran headline menengah
          color: primaryTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 24, // Ukuran headline kecil
          color: primaryTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 22, // Ukuran besar untuk judul utama di layar
          color: secondaryTextColor,
        ),
        titleMedium: TextStyle(
          fontSize: 18, // Ukuran sedang untuk judul atau subtitle
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 14, // Ukuran kecil untuk subtitle atau label
          color: secondaryTextColor,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(
          fontSize: 16, // Ukuran teks utama
          color: primaryTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14, // Ukuran teks sekunder
          color: primaryTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12, // Ukuran untuk teks tambahan atau catatan
          color: secondaryTextColor,
        ),
        labelLarge: TextStyle(
          fontSize:
              14, // Label besar, digunakan untuk tombol atau label penting
          color: secondaryTextColor,
        ),
        labelMedium: TextStyle(
          fontSize: 12, // Label sedang untuk UI elemen
          color: secondaryTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: 11, // Label kecil, digunakan untuk indikator atau ikon
          color: secondaryTextColor,
        ),
      ),
    );
  }
}
