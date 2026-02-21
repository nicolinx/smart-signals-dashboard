import 'dart:async';
import 'dart:developer';

import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/domain/models/device_model.dart';

class DashboardViewModel {
  bool _isAlertActive = false;
  Timer? _driftTimer;

  final _devices = listSignal<DeviceModel>([
    const DeviceModel(
      id: 1,
      name: 'Air Conditioner',
      room: 'Living Room • Cooling',
      valueName: 'Temperature',
      valueUnit: '°C',
      type: DeviceType.ac,
      targetValue: 22.0,
      currentValue: 24.5,
      isOn: true,
    ),
    const DeviceModel(
      id: 2,
      name: 'Smart Lighting',
      room: 'Kitchen • Intensity',
      valueName: 'Intensity',
      valueUnit: '%',
      type: DeviceType.light,
      targetValue: 85.0,
      currentValue: 85.0,
      isOn: true,
    ),
  ]);

  ListSignal<DeviceModel> get devices => _devices;

  DashboardViewModel() {
    _startDriftSimulation();
    _setupAlerts();
  }

  void _startDriftSimulation() {
    _driftTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      final index = _devices.indexWhere((d) => d.type == DeviceType.ac);
      if (index != -1 && _devices[index].isOn) {
        final device = _devices[index];

        if ((device.currentValue - device.targetValue).abs() > 0.1) {
          double step = (device.currentValue > device.targetValue) ? -0.2 : 0.2;
          _devices[index] = device.copyWith(
            currentValue: device.currentValue + step,
          );
        }
      }
    });
  }

  late final totalConsumption = computed(() {
    final total = devices.fold<double>(
      0,
      (sum, device) => sum + device.currentWatt,
    );
    return total.toStringAsFixed(1);
  });

  late final efficiencyScore = computed(() {
    double totalWatt = double.parse(totalConsumption.value);
    if (totalWatt == 0) return 100;

    double score = (1 - (totalWatt / 500)).clamp(0, 1) * 100;
    return score.toInt();
  });

  void updateDevice(int id, {bool? isOn, double? targetValue}) {
    final index = _devices.indexWhere((d) => d.id == id);
    if (index != -1) {
      _devices[index] = _devices[index].copyWith(
        isOn: isOn,
        targetValue: targetValue,
      );
    }
  }

  void _setupAlerts() {
    effect(() {
      final score = efficiencyScore.value;
      if (score < 50 && !_isAlertActive) {
        log("⚠️ WARNING: High power usage detected!");
        _isAlertActive = true;
      } else if (score >= 50) {
        _isAlertActive = false;
      }
    });
  }

  void dispose() {
    _driftTimer?.cancel();
  }
}
