enum DeviceType { ac, light }

class DeviceEntity {
  final int id;
  final String name;
  final String room;
  final DeviceType type;
  final bool isOn;
  final double value;

  const DeviceEntity({
    required this.id,
    required this.name,
    required this.room,
    required this.type,
    this.isOn = false,
    this.value = 0,
  });

  double get currentWatt {
    if (!isOn) return 0.0;

    switch (type) {
      case DeviceType.ac:
        return 150.0 + ((30 - value) * 20.0);
      case DeviceType.light:
        return 40.0 * (value / 100.0);
    }
  }

  DeviceEntity copyWith({bool? isOn, double? value}) {
    return DeviceEntity(
      id: id,
      name: name,
      room: room,
      type: type,
      isOn: isOn ?? this.isOn,
      value: value ?? this.value,
    );
  }
}
