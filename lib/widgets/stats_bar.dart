// lib/widgets/stats_bar.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../config/app_data.dart';
import 'shared_widgets.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.mobile;

    return Container(
      color: AppColors.darkGreen,
      padding: AppSpacing.pagePadding(context).copyWith(
          top: isMobile ? AppSpacing.lg : AppSpacing.xxl,
          bottom: isMobile ? AppSpacing.lg : AppSpacing.xxl),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: isMobile ? AppSpacing.lg : AppSpacing.xxxl,
            runSpacing: AppSpacing.lg,
            children: kStats.map((s) => _StatItem(stat: s)).toList(),
          ),
          SizedBox(height: isMobile ? AppSpacing.lg : AppSpacing.xl),
          AppButton(label: 'Get multiple quotes'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final StatItem stat;
  const _StatItem({required this.stat});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.bar_chart_outlined,
              color: AppColors.textOnDark, size: 28),
          const SizedBox(height: AppSpacing.xs),
          Text(stat.number, style: AppTextStyles.statNumber(context)),
          const SizedBox(height: 2),
          Text(stat.label, style: AppTextStyles.statLabel(context)),
        ],
      );
}
