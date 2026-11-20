// lib/widgets/marketplace_cta.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import 'shared_widgets.dart';

class MarketplaceCtaSection extends StatelessWidget {
  const MarketplaceCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.tablet;

    return SectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Become part of the marketplace today',
              style: AppTextStyles.sectionTitle(context),
              textAlign: TextAlign.center),
          SizedBox(height: AppSpacing.xl),
          isMobile
              ? Column(children: [
                  _SupplierCard(),
                  SizedBox(height: AppSpacing.lg),
                  _RequestHubCard(),
                ])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _SupplierCard()),
                    SizedBox(width: AppSpacing.lg),
                    Expanded(child: _RequestHubCard()),
                  ],
                ),
        ],
      ),
    );
  }
}

class _SupplierCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppRadius.md),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                color: AppColors.pageBg,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.sm),
                child: Image.network(
                  'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600&q=80',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) =>
                      Container(color: AppColors.pageBg),
                ),
              ),
            ),
            SizedBox(height: AppSpacing.lg),
            Text('Create a company profile and upload your product data to attract new buyers',
                style: AppTextStyles.sectionTitle(context)
                    .copyWith(fontSize: 17, fontWeight: FontWeight.w700)),
            SizedBox(height: AppSpacing.sm),
            Text('Present yourself professionally as a supplier on Europe\'s leading B2B platform.',
                style: AppTextStyles.bodyText()),
            SizedBox(height: AppSpacing.sm),
            _CheckItem('75,000 searches per day'),
            _CheckItem('Dedicated support'),
            _CheckItem('Free basic listing'),
            SizedBox(height: AppSpacing.lg),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.sm,
              children: [
                AppButton(label: 'Get a premium profile'),
                AppButton(
                  label: 'Create profile',
                  bg: Colors.transparent,
                  fg: AppColors.darkGreen,
                  outlined: true,
                ),
              ],
            ),
          ],
        ),
      );
}

class _RequestHubCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.lime,
                borderRadius: BorderRadius.circular(AppRadius.xs),
              ),
              child: Text('New for suppliers',
                  style: AppTextStyles.tagText()
                      .copyWith(color: AppColors.white)),
            ),
            SizedBox(height: AppSpacing.md),
            Text('Request Hub',
                style: AppTextStyles.sectionTitle(context)
                    .copyWith(color: AppColors.white, fontSize: 22)),
            SizedBox(height: AppSpacing.sm),
            Text('Find new orders.',
                style: AppTextStyles.bodyText()
                    .copyWith(color: AppColors.textOnDark)),
            SizedBox(height: AppSpacing.xl),
            Text('Browse buyer requests in our new Request Hub',
                style: AppTextStyles.bodyText().copyWith(
                    color: AppColors.white, fontWeight: FontWeight.w700)),
            SizedBox(height: AppSpacing.sm),
            Text(
                'Don\'t wait for buyers to reach out to you – access real-time buyer demand directly on our platform.',
                style: AppTextStyles.bodyText()
                    .copyWith(color: AppColors.textOnDark)),
            SizedBox(height: AppSpacing.md),
            _CheckItemDark('Access real-time buyer demand'),
            _CheckItemDark('Respond to win new business'),
            _CheckItemDark('Try it for free'),
            SizedBox(height: AppSpacing.xl),
            // Mini search
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppRadius.xs),
              ),
              child: Row(
                children: [
                  const SizedBox(width: AppSpacing.md),
                  const Icon(Icons.search, color: AppColors.textLight, size: 18),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search by any keyword',
                        hintStyle: AppTextStyles.bodyText()
                            .copyWith(color: AppColors.textLight),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                  AppButton(label: 'Find requests'),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.lg),
            AppButton(label: 'See what buyers are looking for',
                bg: AppColors.lime),
          ],
        ),
      );
}

class _CheckItem extends StatelessWidget {
  final String text;
  const _CheckItem(this.text);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        child: Row(children: [
          const Icon(Icons.check_circle_outline,
              color: AppColors.lime, size: 16),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
              child: Text(text,
                  style: AppTextStyles.bodyText())),
        ]),
      );
}

class _CheckItemDark extends StatelessWidget {
  final String text;
  const _CheckItemDark(this.text);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        child: Row(children: [
          const Icon(Icons.check_circle_outline,
              color: AppColors.lime, size: 16),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
              child: Text(text,
                  style: AppTextStyles.bodyText()
                      .copyWith(color: AppColors.textOnDark))),
        ]),
      );
}
