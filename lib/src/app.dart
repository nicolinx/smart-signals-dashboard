import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/presentation/controllers/dashboard_controller.dart';
import 'package:smart_signals_dashboard/src/presentation/screens/dashboard_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Use Dependency Injection
    final controller = DashboardController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: DashboardScreen(controller: controller),
    );
  }
}
