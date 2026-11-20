// lib/widgets/footer.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../config/app_data.dart';
import 'shared_widgets.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.tablet;

    return Container(
      color: AppColors.darkGreen,
      child: Column(
        children: [
          // Top CTA strip
          Container(
            color: AppColors.midGreen,
            padding: AppSpacing.sectionPadding(context),
            child: isMobile
                ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    _FooterCtaLeft(),
                    SizedBox(height: AppSpacing.xl),
                    _FooterCtaRight(),
                  ])
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _FooterCtaLeft()),
                      SizedBox(width: AppSpacing.xxl),
                      Expanded(child: _FooterCtaRight()),
                    ],
                  ),
          ),
          // Links
          Padding(
            padding: AppSpacing.sectionPadding(context),
            child: Column(
              children: [
                isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: kFooterColumns
                            .map((col) => _FooterColumn(col: col))
                            .toList(),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: kFooterColumns
                            .map((col) =>
                                Expanded(child: _FooterColumn(col: col)))
                            .toList(),
                      ),
                SizedBox(height: AppSpacing.xl),
                const AppDivider(),
                SizedBox(height: AppSpacing.lg),
                // Social + legal
                Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: AppSpacing.lg,
                  runSpacing: AppSpacing.md,
                  children: [
                    Wrap(spacing: AppSpacing.lg, children: [
                      _FooterSmallLink('General Conditions of Use'),
                      _FooterSmallLink('Privacy policy'),
                      _FooterSmallLink('Privacy notice'),
                      _FooterSmallLink('Cookie policy'),
                    ]),
                    Wrap(spacing: AppSpacing.lg, children: [
                      _SocialIcon(Icons.link, 'LinkedIn'),
                      _SocialIcon(Icons.facebook, 'Facebook'),
                      _SocialIcon(Icons.play_circle_outline, 'YouTube'),
                      _SocialIcon(Icons.close, 'X / Twitter'),
                    ]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterCtaLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Start with ',
                  style: AppTextStyles.sectionTitle(context)
                      .copyWith(color: AppColors.white)),
              TextSpan(
                  text: 'euro',
                  style: AppTextStyles.sectionTitle(context)
                      .copyWith(color: AppColors.white)),
              TextSpan(
                  text: 'pages',
                  style: AppTextStyles.sectionTitle(context)
                      .copyWith(color: AppColors.lime)),
              TextSpan(
                  text: ' today.',
                  style: AppTextStyles.sectionTitle(context)
                      .copyWith(color: AppColors.white)),
            ]),
          ),
          SizedBox(height: AppSpacing.sm),
          Text(
              'Use the full potential of Europe\'s leading B2B marketplace. Start now for free.',
              style: AppTextStyles.bodyText()
                  .copyWith(color: AppColors.textOnDark)),
          SizedBox(height: AppSpacing.lg),
          AppButton(label: 'List my company'),
          SizedBox(height: AppSpacing.sm),
          AppButton(
              label: 'Unlock our exclusive benefits',
              bg: Colors.transparent,
              fg: AppColors.textOnDark,
              outlined: true),
          SizedBox(height: AppSpacing.sm),
          AppButton(
              label: 'Sign in to account',
              bg: Colors.transparent,
              fg: AppColors.textOnDark,
              outlined: true),
          SizedBox(height: AppSpacing.lg),
          Text('Download our app from the App stores:',
              style: AppTextStyles.bodyText()
                  .copyWith(color: AppColors.textOnDark)),
          SizedBox(height: AppSpacing.sm),
          Wrap(spacing: AppSpacing.sm, runSpacing: AppSpacing.sm, children: [
            _SmallStoreBtn('App Store'),
            _SmallStoreBtn('Google Play'),
          ]),
        ],
      );
}

class _FooterCtaRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Trust and partners',
              style: AppTextStyles.footerHeading()),
          SizedBox(height: AppSpacing.md),
          _TrustItem('Certified with BME Seal of Approval'),
          SizedBox(height: AppSpacing.sm),
          _TrustItem('Partner of the marketplace'),
        ],
      );
}

class _TrustItem extends StatelessWidget {
  final String label;
  const _TrustItem(this.label);
  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.verified_outlined, color: AppColors.lime, size: 18),
          SizedBox(width: AppSpacing.sm),
          Expanded(
              child: Text(label, style: AppTextStyles.footerLink())),
        ],
      );
}

class _FooterColumn extends StatelessWidget {
  final FooterColumn col;
  const _FooterColumn({required this.col});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(col.heading, style: AppTextStyles.footerHeading()),
            SizedBox(height: AppSpacing.md),
            ...col.links.map((l) => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Text(l, style: AppTextStyles.footerLink()),
                )),
          ],
        ),
      );
}

class _FooterSmallLink extends StatelessWidget {
  final String text;
  const _FooterSmallLink(this.text);
  @override
  Widget build(BuildContext context) => Text(text,
      style: AppTextStyles.footerLink().copyWith(fontSize: 12));
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  const _SocialIcon(this.icon, this.label);
  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _h = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _h = true),
        onExit: (_) => setState(() => _h = false),
        child: Icon(widget.icon,
            color: _h ? AppColors.lime : AppColors.textOnDark,
            size: 22),
      );
}

class _SmallStoreBtn extends StatelessWidget {
  final String label;
  const _SmallStoreBtn(this.label);
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md, vertical: AppSpacing.xs + 2),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(color: AppColors.textOnDark),
        ),
        child: Text(label, style: AppTextStyles.tagText().copyWith(
            color: AppColors.white, fontSize: 12)),
      );
}
