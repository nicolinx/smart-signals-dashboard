import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/domain/models/device_model.dart';

class DeviceCard extends StatelessWidget {
  final DeviceModel device;
  final Function(bool value) onToggleChanged;
  final Function(double value) onSliderChanged;

  const DeviceCard({
    super.key,
    required this.device,
    required this.onToggleChanged,
    required this.onSliderChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = device.isOn;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: .all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: .circular(20),
        border: Border.all(
          color: isActive
              ? AppTheme.border
              : AppTheme.border.withValues(alpha: 0.05),
        ),
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isActive ? 1.0 : 0.4,
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
                  onChanged: onToggleChanged,
                ),
              ],
            ),

            const SizedBox(height: 32),

            Text(
              device.name,
              style: TextStyle(fontWeight: .bold, fontSize: 16),
            ),
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
                  isActive ? device.displayTarget : "--",
                  style: .new(
                    fontWeight: .bold,
                    fontSize: 14,
                    color: _getAccentColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            AbsorbPointer(
              absorbing: !isActive,
              child: Slider(
                min: minSlider,
                max: maxSlider,
                activeColor: _getAccentColor,
                padding: .zero,
                value: device.targetValue,
                onChanged: onSliderChanged,
              ),
            ),
          ],
        ),
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
    DeviceType.light => 1.0,
  };

  double get maxSlider => switch (device.type) {
    DeviceType.ac => 30.0,
    DeviceType.light => 100.0,
  };
}
