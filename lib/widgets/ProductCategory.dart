import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  MODEL
// ─────────────────────────────────────────────────────────────────────────────

class ProductCategory {
  final String title;
  final int count;
  final String imageUrl;

  const ProductCategory({
    required this.title,
    required this.count,
    required this.imageUrl,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
//  STATIC DATA  (swap with your real API call)
// ─────────────────────────────────────────────────────────────────────────────

const List<ProductCategory> _kCategories = [
  ProductCategory(
    title: 'Mechanical engineering, plant construction and apparatus...',
    count: 205,
    imageUrl:
        'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=400&q=80',
  ),
  ProductCategory(
    title: 'Machine tools and equipment',
    count: 975,
    imageUrl:
        'https://images.unsplash.com/photo-1565043666747-69f6646db940?w=400&q=80',
  ),
  ProductCategory(
    title: 'Metal and metal products',
    count: 3216,
    imageUrl:
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&q=80',
  ),
  ProductCategory(
    title: 'Construction',
    count: 3240,
    imageUrl:
        'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=400&q=80',
  ),
  ProductCategory(
    title: 'Repair, maintenance and modernization',
    count: 571,
    imageUrl:
        'https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=400&q=80',
  ),
  ProductCategory(
    title: 'Software',
    count: 3079,
    imageUrl:
        'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400&q=80',
  ),
  ProductCategory(
    title: 'Logistics, transportation and storage',
    count: 856,
    imageUrl:
        'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=400&q=80',
  ),
  ProductCategory(
    title: 'Refrigeration, air conditioning, ventilation and heating...',
    count: 134,
    imageUrl:
        'https://images.unsplash.com/photo-1621905252507-b35492cc74b4?w=400&q=80',
  ),
  ProductCategory(
    title: 'Electrical engineering',
    count: 3061,
    imageUrl:
        'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&q=80',
  ),
  ProductCategory(
    title: 'Building materials and supplies',
    count: 116,
    imageUrl:
        'https://images.unsplash.com/photo-1590427997260-b6b4e6f4c0c3?w=400&q=80',
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
//  LAYOUT CONSTANTS
//
//  _kImageHeight  — exact image area height you specified (173.59 px).
//                   The card adds a text area below it.
//  _kTextHeight   — fixed text + count area below the image.
//  _kCardHeight   — total card height = image + text. Used by both the grid
//                   delegate (mainAxisExtent) and the hero height formula so
//                   they are always in sync.
//  _kGridSpacing  — gap between rows and columns.
// ─────────────────────────────────────────────────────────────────────────────

const double _kImageHeight = 173.59;
const double _kTextHeight  = 56.0;
const double _kCardHeight  = _kImageHeight + _kTextHeight; // 229.59
const double _kGridSpacing = 10.0;

/// Total pixel height the grid occupies (rows × cardHeight + gaps).
/// Used to give the hero card the exact same height — without IntrinsicHeight
/// (which crashes on GridView / RenderShrinkWrappingViewport).
double _gridTotalHeight(int itemCount, int cols) {
  final int rows = (itemCount / cols).ceil();
  return (rows * _kCardHeight) + ((rows - 1) * _kGridSpacing);
}

// ─────────────────────────────────────────────────────────────────────────────
//  PUBLIC WIDGET
// ─────────────────────────────────────────────────────────────────────────────

/// Drop anywhere in your widget tree.
/// Reads [ResponsiveBreakpoints] from your existing app-level setup.
class ProductCategoriesSection extends StatefulWidget {
  final String heroLabel;
  final String heroTitle;
  final VoidCallback? onSourceNow;

  const ProductCategoriesSection({
    super.key,
    this.heroLabel = '2.6k products',
    this.heroTitle = 'Measuring and Testing Technology',
    this.onSourceNow,
  });

  @override
  State<ProductCategoriesSection> createState() =>
      _ProductCategoriesSectionState();
}

class _ProductCategoriesSectionState extends State<ProductCategoriesSection> {
  // Synchronous init — avoids the Flutter Web DOM null-deref crash that
  // occurs when Future.delayed fires setState during the first frame.
  // For a real API: use addPostFrameCallback → async fetch → setState.
  final List<ProductCategory> _categories = List.of(_kCategories);

  // ── Breakpoint helpers ─────────────────────────────────────────────────────

  bool get _isMobile =>
      ResponsiveBreakpoints.of(context).breakpoint.name == MOBILE;

  bool get _isTablet =>
      ResponsiveBreakpoints.of(context).breakpoint.name == TABLET;

  int get _crossAxisCount {
    if (_isMobile) return 2;
    if (_isTablet) return 3;
    return 5;
  }

  double get _heroWidth {
    if (_isTablet) return 200.0;
    return 260.0;
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F2F2),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: _isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  // ── Desktop / Tablet ───────────────────────────────────────────────────────

  Widget _buildDesktopLayout() {
    final int cols          = _crossAxisCount;
    final double heroHeight = _gridTotalHeight(_categories.length, cols);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Hero: explicit width + height matching the grid's total height
        SizedBox(
          width:  _heroWidth,
          height: heroHeight,
          child: _HeroCard(
            label:       widget.heroLabel,
            title:       widget.heroTitle,
            onSourceNow: widget.onSourceNow,
          ),
        ),
        const SizedBox(width: _kGridSpacing),
        Expanded(
          child: _CategoriesGrid(
            categories:    _categories,
            crossAxisCount: cols,
          ),
        ),
      ],
    );
  }

  // ── Mobile ─────────────────────────────────────────────────────────────────

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: _HeroCard(
            label:       widget.heroLabel,
            title:       widget.heroTitle,
            onSourceNow: widget.onSourceNow,
          ),
        ),
        const SizedBox(height: 12),
        _CategoriesGrid(
          categories:    _categories,
          crossAxisCount: _crossAxisCount,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  HERO CARD
//  Fills whatever SizedBox the parent gives — no self-imposed aspect ratio.
// ─────────────────────────────────────────────────────────────────────────────

class _HeroCard extends StatefulWidget {
  final String label;
  final String title;
  final VoidCallback? onSourceNow;

  const _HeroCard({
    required this.label,
    required this.title,
    this.onSourceNow,
  });

  @override
  State<_HeroCard> createState() => _HeroCardState();
}

class _HeroCardState extends State<_HeroCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double>   _fadeIn;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync:    this,
      duration: const Duration(milliseconds: 600),
    )..forward();
    _fadeIn = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeIn,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        // SizedBox.expand fills the explicit SizedBox from the parent row.
        child: SizedBox.expand(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image — covers the entire card
              Image.network(
                'https://images.unsplash.com/photo-1581092335397-9583eb92d232?w=600&q=80',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.precision_manufacturing,
                      size: 64, color: Colors.grey),
                ),
              ),
              // Dark green gradient overlay
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin:  Alignment.topCenter,
                    end:    Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xDD1B3A1E)],
                    stops:  [0.35, 1.0],
                  ),
                ),
              ),
              // Text + CTA pinned to the bottom
              Positioned(
                left:   16,
                right:  16,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.label,
                      style: const TextStyle(
                        color:      Color(0xFFB8D9B0),
                        fontSize:   12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        color:      Colors.white,
                        fontSize:   18,
                        fontWeight: FontWeight.w700,
                        height:     1.25,
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        onPressed: widget.onSourceNow ?? () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4CAF50),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          textStyle: const TextStyle(
                            fontSize:   13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: const Text('Source now'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  CATEGORIES GRID
//
//  mainAxisExtent = _kCardHeight (fixed px) → row height never changes with
//  column width → zero RenderFlex exceptions at any screen size.
// ─────────────────────────────────────────────────────────────────────────────

class _CategoriesGrid extends StatelessWidget {
  final List<ProductCategory> categories;
  final int crossAxisCount;

  const _CategoriesGrid({
    required this.categories,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics:    const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing:  _kGridSpacing,
        crossAxisSpacing: _kGridSpacing,
        mainAxisExtent:   _kCardHeight, // 229.59 px — fixed, never overflows
      ),
      itemCount:   categories.length,
      itemBuilder: (_, i) => _CategoryCard(category: categories[i]),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  SINGLE CATEGORY CARD
//
//  Image area  = SizedBox(height: _kImageHeight) → exactly 173.59 px,
//                width = whatever the grid column gives (fully responsive).
//                BoxFit.cover scales+crops to fill that area perfectly
//                regardless of the source image's original dimensions.
//
//  Text area   = Expanded → fills the remaining _kTextHeight (56 px) safely
//                because the card's outer height is fixed by mainAxisExtent.
// ─────────────────────────────────────────────────────────────────────────────

class _CategoryCard extends StatefulWidget {
  final ProductCategory category;

  const _CategoryCard({required this.category});

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _hovered = false;

  String _formatCount(int count) {
    if (count >= 1000) {
      final int thousands = count ~/ 1000;
      final int remainder = count % 1000;
      return '$thousands,${remainder.toString().padLeft(3, '0')}';
    }
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor:   SystemMouseCursors.click,
      onEnter:  (_) => setState(() => _hovered = true),
      onExit:   (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          // TODO: navigate to category detail
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve:    Curves.easeOut,
          decoration: BoxDecoration(
            color:        Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color:     Colors.black.withOpacity(_hovered ? 0.13 : 0.06),
                blurRadius: _hovered ? 14 : 4,
                offset:    Offset(0, _hovered ? 5 : 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                // ── IMAGE ──────────────────────────────────────────────────
                //  Height: exactly _kImageHeight (173.59 px).
                //  Width:  100 % of the grid column — fully responsive.
                //  BoxFit.cover: scales the source image (any original size)
                //  uniformly until it fills the box, then crops the overflow.
                //  The source image's aspect ratio is irrelevant — it always
                //  fills the 173.59 px tall slot cleanly.
                SizedBox(
                  height: _kImageHeight,
                  // width is unconstrained — stretches to column width automatically
                  child: Image.network(
                    widget.category.imageUrl,
                    fit: BoxFit.cover,
                    // Align to the top so the "interesting" part of the photo
                    // (usually the subject) stays visible when cropped.
                    alignment: Alignment.topCenter,
                    loadingBuilder: (_, child, progress) => progress == null
                        ? child
                        : Container(
                            color: Colors.grey.shade100,
                            child: const Center(
                              child: SizedBox(
                                width: 20, height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Color(0xFF4CAF50),
                                ),
                              ),
                            ),
                          ),
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey.shade100,
                      child: Icon(Icons.broken_image_outlined,
                          color: Colors.grey.shade400),
                    ),
                  ),
                ),

                // ── TEXT + COUNT ───────────────────────────────────────────
                //  Expanded is safe here: outer card height is fixed by
                //  mainAxisExtent so Flutter knows the remaining space exactly.
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.category.title,
                          textAlign: TextAlign.center,
                          maxLines:  2,
                          overflow:  TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize:   11,
                            fontWeight: FontWeight.w500,
                            color:      Color(0xFF1A1A1A),
                            height:     1.3,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '(${_formatCount(widget.category.count)})',
                          style: const TextStyle(
                            fontSize: 10.5,
                            color:    Color(0xFF777777),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  LOADING SKELETON  (shimmer while data loads — or on first API fetch)
// ─────────────────────────────────────────────────────────────────────────────

class _LoadingSkeleton extends StatefulWidget {
  final bool isMobile;
  const _LoadingSkeleton({required this.isMobile});

  @override
  State<_LoadingSkeleton> createState() => _LoadingSkeletonState();
}

class _LoadingSkeletonState extends State<_LoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double>   _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync:    this,
        duration: const Duration(milliseconds: 1100))
      ..repeat(reverse: true);
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _anim,
      builder: (_, __) {
        final Color c = Color.lerp(
            Colors.grey.shade200, Colors.grey.shade300, _anim.value)!;

        final Widget gridSkeleton = Wrap(
          spacing:    _kGridSpacing,
          runSpacing: _kGridSpacing,
          children: List.generate(
            10,
            (_) => Container(
              width: 130, height: _kCardHeight,
              decoration: BoxDecoration(
                  color: c, borderRadius: BorderRadius.circular(8)),
            ),
          ),
        );

        if (widget.isMobile) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: c, borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(height: 12),
              gridSkeleton,
            ],
          );
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width:  260,
              height: _gridTotalHeight(10, 5),
              decoration: BoxDecoration(
                  color: c, borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(width: 12),
            Expanded(child: gridSkeleton),
          ],
        );
      },
    );
  }
}