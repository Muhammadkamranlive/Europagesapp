// lib/widgets/navbar.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import 'shared_widgets.dart';

class AppNavBar extends StatefulWidget implements PreferredSizeWidget {
  const AppNavBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(56);
  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.tablet;

    return Container(
      height: 56,
      color: AppColors.darkGreen,
      padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppSpacing.md : AppSpacing.xxl),
      child: Row(
        children: [
          const EuropagesLogo(),
          const Spacer(),
          if (!isMobile) ...[
            const _NavItem(icon: Icons.request_quote_outlined, label: 'Get quotes'),
            const SizedBox(width: AppSpacing.lg),
            const _NavItem(icon: Icons.hub_outlined, label: 'Request Hub'),
            const SizedBox(width: AppSpacing.lg),
            const _NavItem(icon: Icons.business_outlined, label: 'List my company'),
            const SizedBox(width: AppSpacing.lg),
            const _NavItem(icon: Icons.notifications_none_outlined, label: ''),
            const SizedBox(width: AppSpacing.md),
            const _NavItem(icon: Icons.person_outline, label: 'Sign in'),
            const SizedBox(width: AppSpacing.md),
            Container(
              width: 28,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    color: Colors.white.withOpacity(0.3), width: 0.5),
              ),
              child: const Center(
                child: Text('CA',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.w900)),
              ),
            ),
          ] else ...[
            IconButton(
              icon: const AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Icon(
                  Icons.menu,
                  key: ValueKey('menu'),
                  color: AppColors.textOnDark,
                ),
              ),
              onPressed: () => _openMobileMenu(context),
            ),
          ],
        ],
      ),
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.midGreen,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.md)),
      ),
      builder: (_) => _MobileMenu(onClose: () => Navigator.of(context).pop()),
    );
  }
}

class _NavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 150),
          style: AppTextStyles.navItem(context).copyWith(
            color: _hovering ? AppColors.white : AppColors.textOnDark,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon,
                  size: 20,
                  color: _hovering ? AppColors.white : AppColors.textOnDark),
              if (widget.label.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(widget.label),
              ],
            ],
          ),
        ),
      );
}

class _MobileMenu extends StatelessWidget {
  final VoidCallback onClose;
  const _MobileMenu({required this.onClose});

  @override
  Widget build(BuildContext context) {
    const items = [
      'Get quotes',
      'Request Hub',
      'List my company',
      'Sign in',
    ];
    return Container(
      color: AppColors.midGreen,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((label) => InkWell(
                  onTap: onClose,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppSpacing.sm + 2),
                    decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Color(0x22FFFFFF), width: 1)),
                    ),
                    child: Text(label,
                        style: AppTextStyles.navItem(context)
                            .copyWith(fontSize: 14, color: AppColors.textOnDark)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
