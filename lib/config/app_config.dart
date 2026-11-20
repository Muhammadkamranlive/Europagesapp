// ============================================================
//  lib/config/app_config.dart
//  ▸ SINGLE SOURCE OF TRUTH
//  Change anything here — every widget picks it up automatically.
// ============================================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ── BREAKPOINTS (used by ResponsiveFramework) ──────────────────
class AppBreakpoints {
  AppBreakpoints._();
  static const double mobile  = 480;
  static const double tablet  = 768;
  static const double desktop = 1200;
  static const double wide    = 1400;
}

// ── PALETTE ───────────────────────────────────────────────────
class AppColors {
  AppColors._();

  // Brand
  static const Color darkGreen   = Color(0xFF1A3A2A);
  static const Color midGreen    = Color(0xFF2D5C40);
  static const Color accentGreen = Color(0xFF5CB85C);
  static const Color lime        = Color(0xFF8DC63F);
  static const Color limeHover   = Color(0xFF7AB234);

  // Neutrals
  static const Color pageBg      = Color(0xFFF4F4F2);
  static const Color white       = Color(0xFFFFFFFF);
  static const Color cardBg      = Color(0xFFFFFFFF);
  static const Color border      = Color(0xFFE0E0E0);

  // Text
  static const Color textDark    = Color(0xFF1E1E1E);
  static const Color textMid     = Color(0xFF555555);
  static const Color textLight   = Color(0xFF888888);
  static const Color textOnDark  = Color(0xFFCDE8D4);
  static const Color textOnDarkMuted = Color(0xFFA8D5B5);
  static const Color textWhite   = Color(0xFFFFFFFF);

  // Accent
  static const Color orange      = Color(0xFFFF6600); // Alibaba partner label
  static const Color starYellow  = Color(0xFFFFC107);

  // Overlay
  static const Color heroOverlay = Color(0x99122010);
  static const Color cardShadow  = Color(0x14000000);
}

// ── SPACING ───────────────────────────────────────────────────
// Use AppSpacing.X everywhere — never write literal numbers.
class AppSpacing {
  AppSpacing._();

  static const double xs   = 4.0;
  static const double sm   = 8.0;
  static const double md   = 16.0;
  static const double lg   = 24.0;
  static const double xl   = 32.0;
  static const double xxl  = 48.0;
  static const double xxxl = 64.0;

  // Page-level horizontal padding (responsive via helper)
  static EdgeInsets pagePadding(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    final h = w < AppBreakpoints.mobile
        ? md
        : w < AppBreakpoints.tablet
            ? lg
            : w < AppBreakpoints.desktop
                ? xl
                : xxl;
    return EdgeInsets.symmetric(horizontal: h);
  }

  // Section vertical padding
  static EdgeInsets sectionPadding(BuildContext ctx) {
    final w = MediaQuery.sizeOf(ctx).width;
    final v = w < AppBreakpoints.mobile ? lg : xxl;
    return pagePadding(ctx).copyWith(top: v, bottom: v);
  }
}

// ── BORDER RADIUS ─────────────────────────────────────────────
class AppRadius {
  AppRadius._();
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 12.0;
  static const double lg  = 16.0;
  static const double pill = 40.0;
}

// ── SHADOWS ───────────────────────────────────────────────────
class AppShadows {
  AppShadows._();
  static const card = [
    BoxShadow(color: AppColors.cardShadow, blurRadius: 12, offset: Offset(0, 2)),
  ];
  static const cardHover = [
    BoxShadow(color: Color(0x22000000), blurRadius: 24, offset: Offset(0, 6)),
  ];
  static const nav = [
    BoxShadow(color: Color(0x33000000), blurRadius: 8, offset: Offset(0, 2)),
  ];
}

// ── TYPOGRAPHY ────────────────────────────────────────────────
class AppTextStyles {
  AppTextStyles._();

  // Responsive font size helper
  static double _fs(BuildContext ctx, double mobile, double desktop) {
    final w = MediaQuery.sizeOf(ctx).width;
    if (w < AppBreakpoints.mobile) return mobile;
    if (w >= AppBreakpoints.desktop) return desktop;
    // linear interpolation between mobile and desktop
    final t = (w - AppBreakpoints.mobile) / (AppBreakpoints.desktop - AppBreakpoints.mobile);
    return mobile + (desktop - mobile) * t;
  }

  static TextStyle heroTitle(BuildContext ctx) => GoogleFonts.lato(
        fontSize: _fs(ctx, 22, 44),
        fontWeight: FontWeight.w900,
        color: AppColors.textWhite,
        height: 1.15,
      );

  static TextStyle sectionTitle(BuildContext ctx) => GoogleFonts.lato(
        fontSize: _fs(ctx, 18, 26),
        fontWeight: FontWeight.w900,
        color: AppColors.textDark,
      );

  static TextStyle statNumber(BuildContext ctx) => GoogleFonts.lato(
        fontSize: _fs(ctx, 22, 34),
        fontWeight: FontWeight.w900,
        color: AppColors.textWhite,
      );

  static TextStyle statLabel(BuildContext ctx) => GoogleFonts.lato(
        fontSize: _fs(ctx, 11, 13),
        fontWeight: FontWeight.w400,
        color: AppColors.textOnDarkMuted,
      );

  static TextStyle navItem(BuildContext ctx) => GoogleFonts.lato(
        fontSize: _fs(ctx, 10, 11),
        fontWeight: FontWeight.w400,
        color: AppColors.textOnDark,
      );

  static TextStyle logoEuro() => GoogleFonts.lato(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: AppColors.textWhite,
        letterSpacing: -0.5,
      );

  static TextStyle logoPages() => GoogleFonts.lato(
        fontSize: 22,
        fontWeight: FontWeight.w900,
        color: AppColors.lime,
        letterSpacing: -0.5,
      );

  static TextStyle cardTitle() => GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
        height: 1.35,
      );

  static TextStyle cardSub() => GoogleFonts.lato(
        fontSize: 12,
        color: AppColors.textLight,
      );

  static TextStyle btnText() => GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
      );

  static TextStyle bodyText() => GoogleFonts.lato(
        fontSize: 14,
        color: AppColors.textMid,
        height: 1.55,
      );

  static TextStyle tagText() => GoogleFonts.lato(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        color: AppColors.textMid,
      );

  static TextStyle trustText() => GoogleFonts.lato(
        fontSize: 12,
        color: AppColors.textDark,
      );

  static TextStyle blogTitle() => GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.lime,
        height: 1.35,
      );

  static TextStyle blogBody() => GoogleFonts.lato(
        fontSize: 12.5,
        color: AppColors.textMid,
        height: 1.5,
      );

  static TextStyle footerHeading() => GoogleFonts.lato(
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: AppColors.textWhite,
        letterSpacing: 0.5,
      );

  static TextStyle footerLink() => GoogleFonts.lato(
        fontSize: 13,
        color: AppColors.textOnDark,
        height: 1.8,
      );
}

// ── GLOBAL THEME ──────────────────────────────────────────────
ThemeData buildAppTheme() => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: AppColors.lime,
        secondary: AppColors.darkGreen,
        surface: AppColors.white,
      ),
      scaffoldBackgroundColor: AppColors.white,
      textTheme: GoogleFonts.latoTextTheme(),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.lime,
          foregroundColor: AppColors.white,
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg, vertical: AppSpacing.sm + 4),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.xs)),
          elevation: 0,
          textStyle: AppTextStyles.btnText(),
        ),
      ),
    );
