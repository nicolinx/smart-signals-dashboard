enum DeviceType { ac, light }

class DeviceEntity {
  final int id;
  final String name;
  final String room;
  final DeviceType type;
  final bool isOn;
  final String valueName;
  final String valueUnit;
  final double currentValue;
  final double targetValue;

  const DeviceEntity({
    required this.id,
    required this.name,
    required this.room,
    required this.type,
    required this.valueName,
    required this.valueUnit,
    this.isOn = false,
    this.currentValue = 0,
    this.targetValue = 0,
  });

  double get currentWatt {
    if (!isOn) return 0.0;

    switch (type) {
      case DeviceType.ac:
        return 150.0 + ((30 - currentValue) * 20.0);
      case DeviceType.light:
        return 40.0 * (currentValue / 100.0);
    }
  }

  String get displayTarget => '${targetValue.toInt()}$valueUnit';
  String get displayCurrent => '${currentValue.toStringAsFixed(1)}$valueUnit';

  DeviceEntity copyWith({
    bool? isOn,
    double? targetValue,
    double? currentValue,
  }) {
    return DeviceEntity(
      id: id,
      name: name,
      room: room,
      type: type,
      valueName: valueName,
      valueUnit: valueUnit,
      isOn: isOn ?? this.isOn,
      currentValue: currentValue ?? this.currentValue,
      targetValue: targetValue ?? this.targetValue,
    );
  }
}
