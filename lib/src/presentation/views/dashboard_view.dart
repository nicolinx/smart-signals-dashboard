import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/presentation/view_models/dashboard_view_model.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/analysis_card.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/avatar_widget.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/device_card.dart';

class DashboardView extends StatefulWidget {
  final DashboardViewModel viewModel;

  const DashboardView({super.key, required this.viewModel});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return Scaffold(
      backgroundColor: AppTheme.background,

      body: Padding(
        padding: .all(36),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            HeaderSection(),
            SizedBox(height: 36),
            Watch((_) {
              if (viewModel.devices.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: DeviceCard(
                        device: viewModel.devices[0],
                        onToggleChanged: (value) => viewModel.updateDevice(
                          viewModel.devices[0].id,
                          isOn: value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DeviceCard(
                        device: viewModel.devices[1],
                        onToggleChanged: (value) => viewModel.updateDevice(
                          viewModel.devices[1].id,
                          isOn: value,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(child: AnalysisCard()),
                  ],
                ),
              );
            }),
            FooterSection(),
          ],
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
                  'TOTAL CONSUMPTION',
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

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Divider(color: AppTheme.border, height: 64),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 12,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w300,
              color: AppTheme.textGrey,
            ),
            children: [
              const TextSpan(text: "BUILT WITH "),
              TextSpan(
                text: "FLUTTER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.accentBlue,
                ),
              ),
              const TextSpan(text: " • "),
              TextSpan(
                text: "SIGNALS",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.accentGreen,
                ),
              ),
              const TextSpan(text: " • "),
              const TextSpan(
                text: "MVVM PATTERN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: .center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.terminal_rounded,
                size: 13,
                color: AppTheme.textGrey.withValues(alpha: 0.6),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "github.com/nicolinx",
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.textGrey.withValues(alpha: 0.6),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
