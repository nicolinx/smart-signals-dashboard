import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/domain/entities/device_entity.dart';
import 'package:smart_signals_dashboard/src/domain/usecases/update_device_usecase.dart';
import 'package:smart_signals_dashboard/src/domain/usecases/watch_devices_usecase.dart';

class DashboardController {
  final WatchDevicesUsecase _watchDevices;
  final UpdateDeviceUsecase _updateDevice;

  final devices = listSignal<DeviceEntity>([]);
  late final _devicesConnection = connect(devices);

  DashboardController(this._watchDevices, this._updateDevice) {
    _init();
  }

  void _init() {
    _devicesConnection << _watchDevices();
  }

  void handleUpdate(int id, {bool? isOn, double? targetValue}) {
    _updateDevice(id, isOn: isOn, targetValue: targetValue);
  }

  void dispose() {
    _devicesConnection.dispose();
  }
}
