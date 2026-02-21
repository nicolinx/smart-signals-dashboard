import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/avatar_widget.dart';

class HeaderSection extends StatelessWidget {
  final ReadonlySignal<String> totalConsumption;

  const HeaderSection({super.key, required this.totalConsumption});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'SmartNode Center',
              style: TextStyle(fontWeight: .bold, fontSize: 32),
            ),
            Text(
              'Manage your local state with Signals.',
              style: .new(
                fontWeight: .w500,
                fontSize: 16,
                color: AppTheme.textGrey,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: .end,
              children: [
                Text(
                  'TOTAL CONSUMPTION',
                  style: .new(
                    fontWeight: .w500,
                    fontSize: 14,
                    color: AppTheme.textGrey,
                  ),
                ),
                Watch((_) {
                  return Text(
                    '${totalConsumption.value} W',
                    style: .new(
                      fontWeight: .bold,
                      fontSize: 32,
                      color: AppTheme.accentGreen,
                    ),
                  );
                }),
              ],
            ),
            SizedBox(width: 12),
            AvatarWidget(),
          ],
        ),
      ],
    );
  }
}
