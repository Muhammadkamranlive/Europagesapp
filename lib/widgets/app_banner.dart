// lib/widgets/app_banner.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';

class AppDownloadBanner extends StatelessWidget {
  const AppDownloadBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.tablet;

    return Container(
      color: AppColors.darkGreen,
      padding: AppSpacing.sectionPadding(context),
      child: isMobile
          ? Column(
              children: [_TextSide(), SizedBox(height: AppSpacing.xl), _MockupSide()],
            )
          : Row(
              children: [
                Expanded(flex: 5, child: _MockupSide()),
                SizedBox(width: AppSpacing.xxl),
                Expanded(flex: 4, child: _TextSide()),
              ],
            ),
    );
  }
}

class _TextSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('The europages app is here!',
              style: AppTextStyles.sectionTitle(context)
                  .copyWith(color: AppColors.white)),
          SizedBox(height: AppSpacing.md),
          Text(
              'Use our improved supplier search or create inquiries on the go with the new europages app.',
              style: AppTextStyles.bodyText()
                  .copyWith(color: AppColors.textOnDark)),
          SizedBox(height: AppSpacing.lg),
          Text('Download in the App Store',
              style: AppTextStyles.bodyText().copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w700)),
          SizedBox(height: AppSpacing.md),
          Wrap(spacing: AppSpacing.md, runSpacing: AppSpacing.sm, children: [
            _StoreBtn(
              icon: Icons.apple,
              line1: 'Download on the',
              line2: 'App Store',
            ),
            _StoreBtn(
              icon: Icons.android,
              line1: 'GET IT ON',
              line2: 'Google Play',
            ),
          ]),
        ],
      );
}

class _MockupSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Image.network(
          'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=400&q=80',
          height: 220,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
              height: 220,
              color: AppColors.midGreen,
              child: const Icon(Icons.phone_android,
                  color: AppColors.textOnDark, size: 60)),
        ),
      );
}

class _StoreBtn extends StatefulWidget {
  final IconData icon;
  final String line1;
  final String line2;
  const _StoreBtn({required this.icon, required this.line1, required this.line2});
  @override
  State<_StoreBtn> createState() => _StoreBtnState();
}

class _StoreBtnState extends State<_StoreBtn> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md, vertical: AppSpacing.sm),
          decoration: BoxDecoration(
            color: _h ? AppColors.white.withOpacity(0.15) : Colors.black,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            border: Border.all(color: AppColors.textOnDark, width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: AppColors.white, size: 28),
              SizedBox(width: AppSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.line1,
                      style: AppTextStyles.tagText()
                          .copyWith(color: AppColors.textOnDark, fontSize: 10)),
                  Text(widget.line2,
                      style: AppTextStyles.footerHeading()
                          .copyWith(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      );
}
