import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';

class AnalysisCard extends StatelessWidget {
  final ReadonlySignal<int> efficiencyScore;

  const AnalysisCard({super.key, required this.efficiencyScore});

  @override
  Widget build(BuildContext context) {
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
              Text(
                'REAL-TIME ANALYSIS',
                style: TextStyle(
                  fontWeight: .bold,
                  fontSize: 14,
                  color: AppTheme.accentGreen,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(
                height: 20,
                width: 20,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballScale,
                  colors: const [AppTheme.accentGreen],
                  strokeWidth: 2,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Text(
            'Energy Efficiency',
            style: TextStyle(fontWeight: .bold, fontSize: 18),
            textAlign: .center,
          ),
          Watch(
            (_) => Column(
              crossAxisAlignment: .center,
              children: [
                Text(
                  '${efficiencyScore.value}%',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: _getStatusColor,
                  ),
                ),
                Text(
                  _getStatusInfo,
                  style: TextStyle(
                    color: _getStatusColor.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Optimized by Signals computed',
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.textGrey,
              fontStyle: .italic,
            ),
            textAlign: .center,
          ),
        ],
      ),
    );
  }

  Color get _getStatusColor {
    Color statusColor = AppTheme.accentGreen;
    if (efficiencyScore.value < 50) {
      statusColor = Colors.redAccent;
    } else if (efficiencyScore.value < 80) {
      statusColor = AppTheme.accentAmber;
    }

    return statusColor;
  }

  String get _getStatusInfo {
    return efficiencyScore.value > 80
        ? 'Excellent'
        : efficiencyScore.value > 50
        ? 'Average'
        : 'High Usage';
  }
}
