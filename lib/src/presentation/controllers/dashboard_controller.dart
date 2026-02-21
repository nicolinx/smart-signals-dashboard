import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/domain/entities/device_entity.dart';
import 'package:smart_signals_dashboard/src/domain/usecases/watch_devices_usecase.dart';

class DashboardController {
  final WatchDevicesUsecase _watchDevices;

  final devices = listSignal<DeviceEntity>([]);
  late final _devicesConnection = connect(devices);

  DashboardController(this._watchDevices) {
    _init();
  }

  void _init() {
    _devicesConnection << _watchDevices();
  }

  void dispose() {
    _devicesConnection.dispose();
  }
}
