import 'package:smart_signals_dashboard/src/domain/entities/device_entity.dart';

class DeviceRepository {
  final List<DeviceEntity> _devices = [
    const DeviceEntity(
      id: 1,
      name: 'Air Conditioner',
      room: 'Living Room • Cooling',
      valueName: 'Temperature',
      valueUnit: '°C',
      type: DeviceType.ac,
      currentValue: 22.0,
      targetValue: 22.0,
      isOn: false,
    ),
    const DeviceEntity(
      id: 2,
      name: 'Smart Lighting',
      room: 'Kitchen • Intensity',
      valueName: 'Intensity',
      valueUnit: '%',
      type: DeviceType.light,
      currentValue: 85.0,
      targetValue: 85.0,
      isOn: true,
    ),
  ];

  Stream<List<DeviceEntity>> watchDevices() async* {
    yield _devices;

    while (true) {
      await Future.delayed(.new(seconds: 3));

      if (_devices[0].type == .ac && _devices[0].isOn) {
        double drift = (DateTime.now().second % 2 == 0) ? 0.15 : -0.1;
        double newValue = (_devices[0].currentValue + drift).clamp(16.0, 30.0);

        _devices[0] = _devices[0].copyWith(currentValue: newValue);
      }

      yield List.from(_devices);
    }
  }

  void updateDevice(int id, {bool? isOn, double? targetValue}) {
    final index = _devices.indexWhere((d) => d.id == id);
    if (index != -1) {
      _devices[index] = _devices[index].copyWith(
        isOn: isOn,
        targetValue: targetValue,
      );
    }
  }
}
