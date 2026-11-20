import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'config/app_config.dart';
import 'screens/home_screen.dart';
import 'widgets/navbar.dart';

void main() => runApp(const EuropagesApp());

class EuropagesApp extends StatelessWidget {
  const EuropagesApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'europages – B2B Marketplace',
        debugShowCheckedModeBanner: false,
        theme: buildAppTheme(),
        // ── ResponsiveFramework: fluid scaling, no overflow ──
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0,    end: 479,  name: MOBILE),
            const Breakpoint(start: 480,  end: 767,  name: TABLET),
            const Breakpoint(start: 768,  end: 1199, name: DESKTOP),
            const Breakpoint(start: 1200, end: 1399, name: '4K'),
            const Breakpoint(start: 1400, end: double.infinity, name: '4K'),
          ],
        ),
        home: const _RootLayout(),
      );
}

class _RootLayout extends StatelessWidget {
  const _RootLayout();

  @override
  Widget build(BuildContext context) => const Scaffold(
        // Sticky NavBar at top
        appBar: AppNavBar(),
        // No resize when keyboard shows (web)
        resizeToAvoidBottomInset: false,
        body: HomeScreen(),
      );
}
