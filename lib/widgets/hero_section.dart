// lib/widgets/hero_section.dart

import 'package:europages/widgets/SearchResultsScreen.dart';
import 'package:flutter/material.dart';
import '../config/app_config.dart';
import 'shared_widgets.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.mobile;

    return Stack(
      children: [
        // Background image
        SizedBox(
          width: double.infinity,
          height: isMobile ? 320 : 380,
          child: Image.network(
            'https://images.unsplash.com/photo-1521737604893-d14cc237f11d?w=1400&q=80',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: AppColors.midGreen),
          ),
        ),
        // Dark overlay
        Container(
          width: double.infinity,
          height: isMobile ? 320 : 380,
          color: AppColors.heroOverlay,
        ),
        // Content
        SizedBox(
          width: double.infinity,
          height: isMobile ? 320 : 380,
          child: Padding(
            padding: AppSpacing.pagePadding(context).copyWith(
              top: isMobile ? AppSpacing.lg : AppSpacing.xl,
              bottom: isMobile ? AppSpacing.lg : AppSpacing.xl,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                  'The leading B2B marketplace\nfor European trade',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heroTitle(context),
                ),
                SizedBox(height: isMobile ? AppSpacing.lg : AppSpacing.xl),
                // Search bar
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 580),
                  child: const _SearchBar(),
                ),
                SizedBox(height: isMobile ? AppSpacing.md : AppSpacing.lg),
                // CTA row
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.lime.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Wrap(
                    clipBehavior: Clip.none,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: AppSpacing.md,
                    runSpacing: AppSpacing.sm,
                    children: [
                      Text(
                        'Post your request to verified suppliers.',
                        style: AppTextStyles.bodyText()
                            .copyWith(color: AppColors.textOnDark),
                      ),
                      const AppButton(label: 'Get quotes'),
                    ],
                  ),
                ),
                SizedBox(height: isMobile ? AppSpacing.md : AppSpacing.lg),
                // Trust badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.93),
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: AppSpacing.sm,
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'euro',
                              style: AppTextStyles.trustText().copyWith(
                                  color: AppColors.darkGreen,
                                  fontWeight: FontWeight.w900)),
                          TextSpan(
                              text: 'pages',
                              style: AppTextStyles.trustText().copyWith(
                                  color: AppColors.lime,
                                  fontWeight: FontWeight.w900)),
                        ]),
                      ),
                      Text('Certificated with BME seal',
                          style: AppTextStyles.trustText()),
                      const SizedBox(width: AppSpacing.xs),
                      Text('A trusted partner of',
                          style: AppTextStyles.trustText()),
                      Text('Alibaba.com',
                          style: AppTextStyles.trustText().copyWith(
                              color: AppColors.orange,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ],
    );
  }
}

// ── SEARCH BAR ────────────────────────────────────────────────
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          boxShadow: AppShadows.nav,
        ),
        child: Row(
          children: [
            const SizedBox(width: AppSpacing.lg),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search term e.g. CNC milling work, packaging, …',
                  hintStyle:
                      AppTextStyles.bodyText().copyWith(color: AppColors.textLight),
                  border: InputBorder.none,
                  isDense: true,
                ),
                style: AppTextStyles.bodyText(),
              ),
            ),
             GestureDetector(
              
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SearchResultsScreen(),
                  ),
                );
              },
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.lime,
                  borderRadius: BorderRadius.circular(AppRadius.pill),
                ),
                child: const Icon(Icons.search, color: AppColors.white, size: 22),
              ),
            ),
          ],
        ),
      );
}
