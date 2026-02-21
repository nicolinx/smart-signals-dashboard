import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';

class DeviceCard extends StatelessWidget {
  const DeviceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(16),
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
                  color: AppTheme.accentBlue,
                  borderRadius: .circular(8),
                ),
                child: Icon(Icons.ac_unit, color: Colors.white, size: 32),
              ),
              Switch(
                activeTrackColor: AppTheme.accentBlue,
                activeThumbColor: Colors.white,
                value: false,
                onChanged: (val) {},
              ),
            ],
          ),

          const SizedBox(height: 32),

          Text(
            'Air Conditioner',
            style: TextStyle(fontWeight: .bold, fontSize: 16),
          ),
          Text(
            'Living Room • Cooling',
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
                'Target Temperature',
                style: .new(fontWeight: .w500, fontSize: 14),
              ),
              Text(
                '22°C',
                style: .new(
                  fontWeight: .bold,
                  fontSize: 14,
                  color: AppTheme.accentBlueLight,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          Slider(
            activeColor: AppTheme.accentBlue,
            padding: .zero,
            value: 0.5,
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}
