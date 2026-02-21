import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';

class AnalysisCard extends StatelessWidget {
  const AnalysisCard({super.key});

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
          Text(
            '92%',
            style: TextStyle(
              fontWeight: .bold,
              fontSize: 56,
              color: AppTheme.accentGreen,
            ),
            textAlign: .center,
          ),
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
}
