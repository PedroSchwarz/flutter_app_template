import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:{{app_name.snakeCase()}}/app/app.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lifter',
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: getIt<GoRouter>(),
    );
  }
}
