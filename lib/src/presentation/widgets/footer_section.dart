import 'package:flutter/material.dart';
import 'package:smart_signals_dashboard/src/core/theme.dart';

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
                  color: AppTheme.accentAmber,
                ),
              ),
              const TextSpan(text: " • "),
              const TextSpan(
                text: "MVVM PATTERN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.accentGreen,
                ),
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
                color: AppTheme.textGrey.withValues(alpha: 0.75),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
