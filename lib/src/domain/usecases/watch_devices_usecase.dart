import 'package:smart_signals_dashboard/src/data/repositories/device_repository.dart';
import 'package:smart_signals_dashboard/src/domain/entities/device_entity.dart';

class WatchDevicesUsecase {
  final DeviceRepository _repository;

  WatchDevicesUsecase(this._repository);

  Stream<List<DeviceEntity>> call() => _repository.watchDevices();
}
