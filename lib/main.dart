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
