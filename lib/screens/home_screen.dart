// lib/screens/home_screen.dart

import 'package:europages/widgets/ProductCategory.dart';
import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/stats_bar.dart';
import '../widgets/products_section.dart';
import '../widgets/categories_section.dart';
import '../widgets/marketplace_cta.dart';
import '../widgets/blog_section.dart';
import '../widgets/app_banner.dart';
import '../widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeroSection(),
              const StatsBar(),
              ProductCategoriesSection(
  heroLabel: '2.6k products',
  heroTitle: 'Measuring and Testing Technology',
  onSourceNow: () => Navigator.pushNamed(context, '/measuring-tech'),
),
              const ProductsSection(),
              const CategoriesSection(),
              const MarketplaceCtaSection(),
              const BlogSection(),
              const AppDownloadBanner(),
              const AppFooter(),
            ],
          ),
        ),
      );
}
