// lib/widgets/shared_widgets.dart
// Reusable atomic widgets — all styling from AppConfig only.

import 'package:flutter/material.dart';
import '../config/app_config.dart';

// ── LOGO ──────────────────────────────────────────────────────
class EuropagesLogo extends StatelessWidget {
  const EuropagesLogo({super.key});
  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(children: [
          TextSpan(text: 'euro', style: AppTextStyles.logoEuro()),
          TextSpan(text: 'pages', style: AppTextStyles.logoPages()),
        ]),
      );
}

// ── PRIMARY BUTTON ────────────────────────────────────────────
class AppButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final Color? bg;
  final Color? fg;
  final bool outlined;
  const AppButton({
    super.key,
    required this.label,
    this.onTap,
    this.bg,
    this.fg,
    this.outlined = false,
  });
  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) {
    final bg = widget.outlined
        ? (_hovering ? (widget.bg ?? AppColors.lime) : Colors.transparent)
        : (_hovering ? AppColors.limeHover : (widget.bg ?? AppColors.lime));
    final fg = widget.outlined
        ? (_hovering ? AppColors.white : (widget.bg ?? AppColors.lime))
        : (widget.fg ?? AppColors.white);
    final border = widget.outlined
        ? Border.all(color: widget.bg ?? AppColors.lime, width: 1.5)
        : null;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg, vertical: AppSpacing.sm + 2),
          decoration: BoxDecoration(
            color: bg,
            border: border,
            borderRadius: BorderRadius.circular(AppRadius.xs),
          ),
          child: Text(widget.label,
              style: AppTextStyles.btnText().copyWith(color: fg)),
        ),
      ),
    );
  }
}

// ── HOVER CARD ────────────────────────────────────────────────
class HoverCard extends StatefulWidget {
  final Widget child;
  final double borderRadius;
  const HoverCard({super.key, required this.child, this.borderRadius = AppRadius.sm});
  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hovering ? -3 : 0, 0),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(color: AppColors.border),
            boxShadow: _hovering ? AppShadows.cardHover : AppShadows.card,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: widget.child,
          ),
        ),
      );
}

// ── SECTION WRAPPER ───────────────────────────────────────────
class SectionWrapper extends StatelessWidget {
  final Widget child;
  final Color? background;
  const SectionWrapper({super.key, required this.child, this.background});
  @override
  Widget build(BuildContext context) => Container(
        color: background ?? AppColors.white,
        padding: AppSpacing.sectionPadding(context),
        child: child,
      );
}

// ── DIVIDER ───────────────────────────────────────────────────
class AppDivider extends StatelessWidget {
  const AppDivider({super.key});
  @override
  Widget build(BuildContext context) =>
      const Divider(color: AppColors.border, height: 1, thickness: 1);
}

// ── NETWORK IMAGE WITH LOADING ────────────────────────────────
class AppNetworkImage extends StatelessWidget {
  final String url;
  final double? height;
  final BoxFit fit;
  const AppNetworkImage(this.url,
      {super.key, this.height, this.fit = BoxFit.cover});
  @override
  Widget build(BuildContext context) => Image.network(
        url,
        height: height,
        width: double.infinity,
        fit: fit,
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : Container(
                height: height,
                color: const Color(0xFFEEEEEE),
                child: const Center(
                  child: CircularProgressIndicator(
                      color: AppColors.lime, strokeWidth: 2),
                ),
              ),
        errorBuilder: (_, __, ___) => Container(
          height: height,
          color: const Color(0xFFDDDDDD),
          child: const Icon(Icons.broken_image_outlined,
              color: AppColors.textLight, size: 32),
        ),
      );
}

// ── RESPONSIVE GRID ───────────────────────────────────────────
// Automatically picks column count based on viewport width.
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int mobileCols;
  final int tabletCols;
  final int desktopCols;
  final double spacing;
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.mobileCols = 1,
    this.tabletCols = 2,
    this.desktopCols = 4,
    this.spacing = AppSpacing.md,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final cols = w < AppBreakpoints.mobile
        ? mobileCols
        : w < AppBreakpoints.tablet
            ? tabletCols
            : w < AppBreakpoints.desktop
                ? (tabletCols + desktopCols) ~/ 2
                : desktopCols;

    return LayoutBuilder(builder: (_, constraints) {
      final itemWidth =
          (constraints.maxWidth - spacing * (cols - 1)) / cols;
      return Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: children
            .map((c) => SizedBox(width: itemWidth, child: c))
            .toList(),
      );
    });
  }
}
