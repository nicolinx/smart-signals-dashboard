enum DeviceType { ac, light }

class DeviceModel {
  final int id;
  final String name;
  final String room;
  final DeviceType type;
  final bool isOn;
  final String valueName;
  final String valueUnit;
  final double currentValue;
  final double targetValue;

  const DeviceModel({
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

  // Business logic to calculate wattage.
  // This value is used by the 'totalConsumption' computed signal in the ViewModel.
  double get currentWatt {
    if (!isOn) return 0.0;

    return switch (type) {
      DeviceType.ac => 150.0 + ((30 - currentValue) * 20.0),
      DeviceType.light => 40.0 * (targetValue / 100.0),
    };
  }

  // Helper getters for UI display
  String get displayTarget => '${targetValue.toInt()}$valueUnit';
  String get displayCurrent => '${currentValue.toStringAsFixed(1)}$valueUnit';

  // Immutable update pattern.
  // Essential for Signals to detect changes when we replace an item in ListSignal.
  DeviceModel copyWith({
    bool? isOn,
    double? targetValue,
    double? currentValue,
  }) {
    return DeviceModel(
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
