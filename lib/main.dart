import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes.dart';
import 'screen/screen.dart';
import 'config/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;

  // void _updateStatusBar() {
  //   // Atur gaya status bar berdasarkan mode tema
  //   final isDark = themeMode == ThemeMode.dark;
  //   SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(
  //       statusBarColor: Colors.transparent, // Transparan
  //       statusBarIconBrightness:
  //           isDark ? Brightness.light : Brightness.dark, // Ikon
  //       systemNavigationBarColor:
  //           isDark ? Colors.black : Colors.white, // Warna navigasi
  //       systemNavigationBarIconBrightness:
  //           isDark ? Brightness.light : Brightness.dark, // Ikon navigasi
  //       statusBarBrightness:
  //           isDark ? Brightness.dark : Brightness.light, // Untuk perangkat iOS
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Messaging App UI',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        home: const MenuPage(),
        onGenerateRoute: Routes.generateRoute);
  }
}
