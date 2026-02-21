import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/presentation/controllers/dashboard_controller.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/avatar_widget.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardController controller;

  const DashboardScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Padding(
        padding: .all(36),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [HeaderSection()],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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
                  'TOTAL CONSUMTION',
                  style: .new(
                    fontWeight: .w500,
                    fontSize: 14,
                    color: AppTheme.textGrey,
                  ),
                ),
                Text(
                  '248.5 W',
                  style: .new(
                    fontWeight: .bold,
                    fontSize: 32,
                    color: AppTheme.accentGreen,
                  ),
                ),
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
