import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';
import 'package:smart_signals_dashboard/src/presentation/view_models/dashboard_view_model.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/analysis_card.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/device_card.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/footer_section.dart';
import 'package:smart_signals_dashboard/src/presentation/widgets/header_section.dart';

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
            HeaderSection(totalConsumption: viewModel.totalConsumption),
            SizedBox(height: 36),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Watch(
                      (_) => DeviceCard(
                        device: viewModel.devices[0],
                        onToggleChanged: (val) =>
                            viewModel.updateDevice(1, isOn: val),
                        onSliderChanged: (val) =>
                            viewModel.updateDevice(1, targetValue: val),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Watch(
                      (_) => DeviceCard(
                        device: viewModel.devices[1],
                        onToggleChanged: (val) =>
                            viewModel.updateDevice(2, isOn: val),
                        onSliderChanged: (val) =>
                            viewModel.updateDevice(2, targetValue: val),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AnalysisCard(
                      efficiencyScore: viewModel.efficiencyScore,
                    ),
                  ),
                ],
              ),
            ),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
