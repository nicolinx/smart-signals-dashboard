import 'package:smart_signals_dashboard/src/domain/entities/device_entity.dart';

class DeviceRepository {
  final List<DeviceEntity> _devices = [
    const DeviceEntity(
      id: 1,
      name: 'Air Conditioner',
      room: 'Living Room • Cooling',
      type: DeviceType.ac,
      value: 22.0, // Celcius
      isOn: true,
    ),
    const DeviceEntity(
      id: 2,
      name: 'Smart Lighting',
      room: 'Kitchen • Intensity',
      type: DeviceType.light,
      value: 85.0, // Intensity
      isOn: true,
    ),
  ];

  Stream<List<DeviceEntity>> watchDevices() async* {
    yield _devices;

    while (true) {
      await Future.delayed(.new(seconds: 3));

      if (_devices[0].type == .ac && _devices[0].isOn) {
        double drift = (DateTime.now().second % 2 == 0) ? 0.15 : -0.1;
        double newValue = _devices[0].value + drift.clamp(16.0, 30.0);

        _devices[0] = _devices[0].copyWith(value: newValue);
      }

      yield List.from(_devices);
    }
  }
}
