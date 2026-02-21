import 'package:smart_signals_dashboard/src/data/repositories/device_repository.dart';

class UpdateDeviceUsecase {
  final DeviceRepository _repository;

  UpdateDeviceUsecase(this._repository);

  void call(int id, {bool? isOn, double? targetValue}) =>
      _repository.updateDevice(id, isOn: isOn, targetValue: targetValue);
}
