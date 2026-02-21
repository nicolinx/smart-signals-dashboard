import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/data/repositories/device_repository.dart';
import 'package:smart_signals_dashboard/src/domain/usecases/update_device_usecase.dart';
import 'package:smart_signals_dashboard/src/domain/usecases/watch_devices_usecase.dart';
import 'package:smart_signals_dashboard/src/presentation/controllers/dashboard_controller.dart';
import 'package:smart_signals_dashboard/src/presentation/screens/dashboard_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Use Dependency Injection
    final repo = DeviceRepository();
    final watchUC = WatchDevicesUsecase(repo);
    final updateUC = UpdateDeviceUsecase(repo);
    final controller = DashboardController(watchUC, updateUC);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: DashboardScreen(controller: controller),
    );
  }
}
