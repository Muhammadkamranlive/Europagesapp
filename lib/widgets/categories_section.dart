// lib/widgets/categories_section.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../config/app_data.dart';
import 'shared_widgets.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      background: AppColors.pageBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search by product categories and get inspired',
            style: AppTextStyles.sectionTitle(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.lg),
          ResponsiveGrid(
            mobileCols: 2,
            tabletCols: 3,
            desktopCols: 5,
            spacing: AppSpacing.md,
            children: kCategories
                .map((c) => _CategoryCard(item: c))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final CategoryItem item;
  const _CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) => HoverCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(item.imageUrl, height: 120),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.sm + 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cardTitle()),
                  const SizedBox(height: 2),
                  Text('(${_formatCount(item.count)})',
                      style: AppTextStyles.cardSub()),
                ],
              ),
            ),
          ],
        ),
      );

  String _formatCount(int n) =>
      n >= 1000 ? '${(n / 1000).toStringAsFixed(n % 1000 == 0 ? 0 : 1)}k' : '$n';
}
