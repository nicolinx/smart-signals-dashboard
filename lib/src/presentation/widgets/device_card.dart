import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/domain/entities/device_entity.dart';

class DeviceCard extends StatelessWidget {
  final DeviceEntity device;
  final Function(bool value) onToggleChanged;

  const DeviceCard({
    super.key,
    required this.device,
    required this.onToggleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = device.isOn;
    final Color activeColor = _getAccentColor;
    final Color disabledColor = AppTheme.textGrey.withValues(alpha: 0.2);

    return Container(
      padding: .all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: .circular(20),
        border: .all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getAccentColor,
                  borderRadius: .circular(8),
                ),
                child: Icon(_getIcon, color: Colors.white, size: 32),
              ),
              Switch(
                activeTrackColor: _getAccentColor,
                activeThumbColor: Colors.white,
                value: device.isOn,
                onChanged: (val) {
                  onToggleChanged(val);
                },
              ),
            ],
          ),

          const SizedBox(height: 32),

          Text(device.name, style: TextStyle(fontWeight: .bold, fontSize: 16)),
          Text(
            '${device.room}${device.type == .ac ? ' (Now: ${device.displayCurrent})' : ''}',
            style: .new(
              fontWeight: .w500,
              fontSize: 14,
              color: AppTheme.textGrey,
            ),
          ),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text(
                device.valueName,
                style: .new(fontWeight: .w500, fontSize: 14),
              ),
              Text(
                device.displayTarget,
                style: .new(
                  fontWeight: .bold,
                  fontSize: 14,
                  color: _getAccentColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Slider(
            min: minSlider,
            max: maxSlider,
            activeColor: _getAccentColor,
            padding: .zero,
            value: device.targetValue,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }

  IconData get _getIcon {
    switch (device.type) {
      case DeviceType.ac:
        return Icons.ac_unit_rounded;
      case DeviceType.light:
        return Icons.lightbulb_outlined;
    }
  }

  Color get _getAccentColor {
    switch (device.type) {
      case DeviceType.ac:
        return AppTheme.accentBlue;
      case DeviceType.light:
        return AppTheme.accentAmber;
    }
  }

  double get minSlider => switch (device.type) {
    DeviceType.ac => 16.0,
    DeviceType.light => 0.0,
  };

  double get maxSlider => switch (device.type) {
    DeviceType.ac => 30.0,
    DeviceType.light => 100.0,
  };
}
