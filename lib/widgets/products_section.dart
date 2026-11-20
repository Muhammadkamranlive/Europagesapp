// lib/widgets/products_section.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../config/app_data.dart';
import 'shared_widgets.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product recommendation',
              style: AppTextStyles.sectionTitle(context)),
          SizedBox(height: AppSpacing.lg),
          SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: kProducts.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: AppSpacing.md),
              itemBuilder: (ctx, i) => _ProductCard(item: kProducts[i]),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductItem item;
  const _ProductCard({required this.item});

  @override
  Widget build(BuildContext context) => HoverCard(
        child: SizedBox(
          width: 190,
          height: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppNetworkImage(item.imageUrl, height: 140),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.sm + 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.cardTitle()),
                      Text(item.flag, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
