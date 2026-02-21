import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/presentation/view_models/dashboard_view_model.dart';
import 'package:smart_signals_dashboard/src/presentation/views/dashboard_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Use Dependency Injection
    final viewModel = DashboardViewModel();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: DashboardView(viewModel: viewModel),
    );
  }
}
