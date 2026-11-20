// lib/screens/search_results_screen.dart
//
// Reuses exclusively:
//   AppColors, AppTextStyles, AppSpacing, AppRadius, AppShadows, AppBreakpoints
//   HoverCard, AppNetworkImage, AppButton, AppDivider, EuropagesLogo  ← shared_widgets
//   GoogleFonts.lato                                                  ← app typography

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/app_config.dart';
import '../widgets/shared_widgets.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  MODELS
// ─────────────────────────────────────────────────────────────────────────────

class ServiceListing {
  final String title;
  final List<String> bullets;
  final String companyName;
  final String countryFlag;
  final bool verified;
  final bool respondsReliably;
  final String? priceRange;
  final String? minOrder;
  final String imageUrl;

  const ServiceListing({
    required this.title,
    required this.bullets,
    required this.companyName,
    required this.countryFlag,
    this.verified = false,
    this.respondsReliably = false,
    this.priceRange,
    this.minOrder,
    required this.imageUrl,
  });
}

class _FilterOption {
  final String label;
  final int count;
  bool selected;
  _FilterOption({required this.label, required this.count, this.selected = false});
}

class _FilterGroup {
  final String title;
  final List<_FilterOption> options;
  _FilterGroup({required this.title, required this.options});
}

// ─────────────────────────────────────────────────────────────────────────────
//  STATIC DATA
// ─────────────────────────────────────────────────────────────────────────────

const List<ServiceListing> _kListings = [
  ServiceListing(
    title: 'Comprehensive Software Engineering Services for Custom Solutions and High-Performance...',
    bullets: ['Full lifecycle embedded software dev', 'AUTOSAR, Linux, HPC expertise', 'Custom solutions for automotive, industrial'],
    companyName: 'BringSense Technologies',
    countryFlag: '🇷🇴',
    verified: true,
    imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600&q=80',
  ),
  ServiceListing(
    title: 'Smart City Solutions',
    bullets: ['Real-time data for urban efficiency', 'Customized sustainability solutions', 'Ongoing tech support included'],
    companyName: 'Alpha, Enginyeria de Telecomunicacions S.L.',
    countryFlag: '🇪🇸',
    verified: true,
    imageUrl: 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=600&q=80',
  ),
  ServiceListing(
    title: 'IT Solutions',
    bullets: ['Scalable ERPII system for growth', 'Customized interface adjustments', 'High security and data protection'],
    companyName: 'Ludwig Zenger Industrie-Service GmbH',
    countryFlag: '🇩🇪',
    verified: true,
    imageUrl: 'https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=600&q=80',
  ),
  ServiceListing(
    title: 'IT Solutions',
    bullets: ['Efficient resource planning', 'Expertise in IT relocations', 'Comprehensive project support'],
    companyName: 'Comdion GmbH',
    countryFlag: '🇦🇹',
    verified: true,
    priceRange: '1,00 – 1.000,00 €',
    minOrder: '1 unit',
    imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=600&q=80',
  ),
  ServiceListing(
    title: 'It Solutions',
    bullets: ['Comprehensive IT maintenance', 'Web & email server support', 'CRM & ERP expertise'],
    companyName: 'WEBGARDEN KFT.',
    countryFlag: '🇭🇺',
    verified: true,
    imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=600&q=80',
  ),
  ServiceListing(
    title: 'Modular and efficient data centers for digital infrastructure | EQUIMODAL',
    bullets: ['Scalable capacity adapts to growth', 'Preconfigured for rapid deployment', 'Energy-efficient cooling solutions'],
    companyName: 'EQUIMODAL',
    countryFlag: '🇪🇸',
    verified: true,
    minOrder: '1 Flat rate',
    imageUrl: 'https://images.unsplash.com/photo-1544197150-b99a580bb7a8?w=600&q=80',
  ),
  ServiceListing(
    title: 'Comprehensive Hardware Engineering Solutions for High-Quality, Production-Ready...',
    bullets: ['Custom hardware solutions tailored to client needs', 'ASPICE-aligned processes ensure top-tier quality', 'Expertise in EMC, thermal, and power efficiency'],
    companyName: 'BringSense Technologies',
    countryFlag: '🇷🇴',
    verified: true,
    imageUrl: 'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=600&q=80',
  ),
  ServiceListing(
    title: 'Software Development for Medical Technology – ColiSoft develops secure, scalable software fo...',
    bullets: ['Modular software for medical systems', 'GDPR-compliant and secure solutions', 'Future-proof and adaptable architectures'],
    companyName: 'ColiSoft UG (haftungsbeschränkt)',
    countryFlag: '🇩🇪',
    verified: true,
    respondsReliably: true,
    minOrder: '1 Flat rate',
    imageUrl: 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=600&q=80',
  ),
  ServiceListing(
    title: 'Digitizing Invoice Verification – Automated Approval Processes for SMEs | HUEBINET IT-...',
    bullets: ['Automate invoicing with rule-based approval chains', 'Seamless ERP/DMS integration for smooth workflows', 'Real-time reporting for audits and controlling'],
    companyName: 'HUEBINET Informationsmanageme...',
    countryFlag: '🇩🇪',
    verified: true,
    respondsReliably: true,
    priceRange: '999,00 – 1.499,00 €',
    minOrder: '1 day',
    imageUrl: 'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600&q=80',
  ),
  ServiceListing(
    title: 'IT solutions',
    bullets: ['Customized web platforms', 'Tailor-made CRM solutions', 'Advanced SEO services'],
    companyName: 'TechWeb Solutions GmbH',
    countryFlag: '🇩🇪',
    imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=600&q=80',
  ),
  ServiceListing(
    title: 'IT Solutions',
    bullets: ['Comprehensive IT support', 'Proactive system maintenance', 'Enhanced operational efficiency'],
    companyName: 'IT Support Pro SAS',
    countryFlag: '🇫🇷',
    imageUrl: 'https://images.unsplash.com/photo-1563986768609-322da13575f3?w=600&q=80',
  ),
  ServiceListing(
    title: 'Software services',
    bullets: ['Tailored integration solutions', 'Optimize business processes', 'Seamless system connectivity'],
    companyName: 'SoftServ GmbH',
    countryFlag: '🇩🇪',
    imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600&q=80',
  ),
];

List<_FilterGroup> _buildFilters() => [
  _FilterGroup(title: 'Scope of Services', options: [
    _FilterOption(label: 'Consulting And Concept Development', count: 166),
    _FilterOption(label: 'Ongoing Project Support', count: 153),
  ]),
  _FilterGroup(title: 'Services', options: [
    _FilterOption(label: 'IT Project Management', count: 41),
    _FilterOption(label: 'IT Consulting and Strategic Development', count: 41),
    _FilterOption(label: 'Other', count: 36),
  ]),
  _FilterGroup(title: 'Consulting Field', options: [
    _FilterOption(label: 'IT Security', count: 37),
    _FilterOption(label: 'IT Management', count: 16),
    _FilterOption(label: 'Software', count: 12),
  ]),
  _FilterGroup(title: 'Supplier country', options: [
    _FilterOption(label: '🇩🇪  Germany', count: 441),
    _FilterOption(label: '🇫🇷  France', count: 87),
    _FilterOption(label: '🇬🇧  United Kingdom', count: 44),
    _FilterOption(label: '🇦🇹  Austria', count: 27),
  ]),
  _FilterGroup(title: 'Company type', options: [
    _FilterOption(label: 'Manufacturer/Producer', count: 115),
    _FilterOption(label: 'Customer-specific manufacturer', count: 167),
    _FilterOption(label: 'Distributor', count: 136),
    _FilterOption(label: 'Service provider', count: 679),
    _FilterOption(label: 'Wholesaler', count: 75),
  ]),
  _FilterGroup(title: 'Company profile', options: [
    _FilterOption(label: 'Verified', count: 457),
    _FilterOption(label: 'Responds reliably', count: 124),
  ]),
];

// ─────────────────────────────────────────────────────────────────────────────
//  LAYOUT CONSTANTS — mirrors ProductCategory._kImageHeight / _kCardHeight
// ─────────────────────────────────────────────────────────────────────────────

const double _kImageHeight    = 140.0;
const double _kTextHeight     = 226.0;
const double _kCardHeight     = _kImageHeight + _kTextHeight; // 366
const double _kGridSpacing    = 14.0;
const double _kSidebarW       = 258.0;
const double _kTabletSidebarW = 218.0;

// ─────────────────────────────────────────────────────────────────────────────
//  SCREEN
// ─────────────────────────────────────────────────────────────────────────────

class SearchResultsScreen extends StatefulWidget {
  final String query;
  final int totalCount;

  const SearchResultsScreen({
    super.key,
    this.query = 'IT solutions',
    this.totalCount = 748,
  });

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  late List<_FilterGroup> _filters;

  // ── same breakpoint helpers as ProductCategoriesSection ─────
  bool get _isMobile {
    final w = MediaQuery.sizeOf(context).width;
    return w < AppBreakpoints.mobile;
  }

  bool get _isTablet {
    final w = MediaQuery.sizeOf(context).width;
    return w >= AppBreakpoints.mobile && w < AppBreakpoints.desktop;
  }

  int get _crossAxisCount {
    if (_isMobile) return 1;
    if (_isTablet) return 2;
    return 3;
  }

  double get _sidebarWidth => _isTablet ? _kTabletSidebarW : _kSidebarW;

  @override
  void initState() {
    super.initState();
    _filters = _buildFilters();
  }

  void _resetFilters() => setState(() {
    for (final g in _filters) {
      for (final o in g.options) o.selected = false;
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBg,
      appBar: _SearchNavBar(initialQuery: widget.query),
      body: _isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
    );
  }

  Widget _buildDesktopLayout() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: _sidebarWidth,
        child: _FilterSidebar(
          filters: _filters,
          onReset: _resetFilters,
          onChanged: () => setState(() {}),
        ),
      ),
      Expanded(
        child: _ResultsBody(
          query: widget.query,
          totalCount: widget.totalCount,
          crossAxisCount: _crossAxisCount,
        ),
      ),
    ],
  );

  Widget _buildMobileLayout() => Stack(
    children: [
      _ResultsBody(
        query: widget.query,
        totalCount: widget.totalCount,
        crossAxisCount: _crossAxisCount,
      ),
      Positioned(
        bottom: AppSpacing.lg,
        right: AppSpacing.md,
        child: FloatingActionButton.extended(
          backgroundColor: AppColors.darkGreen,
          onPressed: () => _showMobileFilters(context),
          icon: const Icon(Icons.filter_list, color: AppColors.white),
          label: Text('Filters',
              style: GoogleFonts.lato(
                  color: AppColors.white, fontWeight: FontWeight.w700)),
        ),
      ),
    ],
  );

  void _showMobileFilters(BuildContext ctx) => showModalBottomSheet(
    context: ctx,
    isScrollControlled: true,
    backgroundColor: AppColors.white,
    shape: const RoundedRectangleBorder(
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(AppRadius.md)),
    ),
    builder: (_) => DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (_, controller) => _FilterSidebar(
        filters: _filters,
        onReset: _resetFilters,
        onChanged: () => setState(() {}),
        scrollController: controller,
      ),
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
//  SEARCH NAVBAR
//  Reuses: EuropagesLogo, _NavItem pattern from navbar.dart,
//          _SearchBar visual from hero_section.dart (controller-driven copy)
// ─────────────────────────────────────────────────────────────────────────────

class _SearchNavBar extends StatefulWidget implements PreferredSizeWidget {
  final String initialQuery;
  const _SearchNavBar({required this.initialQuery});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  State<_SearchNavBar> createState() => _SearchNavBarState();
}

class _SearchNavBarState extends State<_SearchNavBar> {
  late final TextEditingController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = TextEditingController(text: widget.initialQuery);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

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
          // EuropagesLogo from shared_widgets — unchanged
          const EuropagesLogo(),
          const SizedBox(width: AppSpacing.lg),

          // _SearchBar clone from hero_section — same look, controller-driven
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 580),
              child: _InlineSearchBar(controller: _ctrl),
            ),
          ),

          // Nav items — identical to _NavItem in navbar.dart
          if (!isMobile) ...[
            const SizedBox(width: AppSpacing.lg),
            _NavAction(icon: Icons.request_quote_outlined, label: 'Get quotes'),
            const SizedBox(width: AppSpacing.lg),
            _NavAction(icon: Icons.hub_outlined, label: 'Request Hub'),
            const SizedBox(width: AppSpacing.lg),
            _NavAction(icon: Icons.business_outlined, label: 'List my company'),
          ],
          const SizedBox(width: AppSpacing.md),
          _NavAction(icon: Icons.notifications_none_outlined, label: ''),
          const SizedBox(width: AppSpacing.sm),
          _NavAction(icon: Icons.person_outline, label: 'Sign in'),
          const SizedBox(width: AppSpacing.sm),
          // Country flag — same as navbar.dart
          Container(
            width: 28, height: 20,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(AppRadius.xs - 1),
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
        ],
      ),
    );
  }
}

// Visual copy of HeroSection's _SearchBar — controller-driven so query persists
class _InlineSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const _InlineSearchBar({required this.controller});

  @override
  Widget build(BuildContext context) => Container(
    height: 38,
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      boxShadow: AppShadows.nav,
    ),
    child: Row(
      children: [
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: TextField(
            controller: controller,
            style: AppTextStyles.bodyText()
                .copyWith(color: AppColors.textDark),
            decoration: InputDecoration(
              hintText: 'Search term e.g. IT solutions…',
              hintStyle: AppTextStyles.bodyText()
                  .copyWith(color: AppColors.textLight),
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => controller.clear(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Icon(Icons.close, size: 15, color: AppColors.textLight),
          ),
        ),
        // Lime circle — same as HeroSection's _SearchBar
        Container(
          width: 38, height: 38,
          decoration: const BoxDecoration(
            color: AppColors.lime,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.search, color: AppColors.white, size: 20),
        ),
      ],
    ),
  );
}

// Identical to navbar.dart's _NavItem (hover color swap)
class _NavAction extends StatefulWidget {
  final IconData icon;
  final String label;
  const _NavAction({required this.icon, required this.label});
  @override
  State<_NavAction> createState() => _NavActionState();
}

class _NavActionState extends State<_NavAction> {
  bool _hovering = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => _hovering = true),
    onExit:  (_) => setState(() => _hovering = false),
    child: AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 150),
      style: AppTextStyles.navItem(context).copyWith(
        color: _hovering ? AppColors.white : AppColors.textOnDark,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 20,
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

// ─────────────────────────────────────────────────────────────────────────────
//  RESULTS BODY — breadcrumb + title + SliverGrid
// ─────────────────────────────────────────────────────────────────────────────

class _ResultsBody extends StatelessWidget {
  final String query;
  final int totalCount;
  final int crossAxisCount;

  const _ResultsBody({
    required this.query,
    required this.totalCount,
    required this.crossAxisCount,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final isMobile = w < AppBreakpoints.mobile;
    final hPad = isMobile ? AppSpacing.md : AppSpacing.lg;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHeader(context, hPad)),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(hPad, 0, hPad, AppSpacing.xxxl),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:   crossAxisCount,
              mainAxisSpacing:  _kGridSpacing,
              crossAxisSpacing: _kGridSpacing,
              mainAxisExtent:   _kCardHeight, // fixed — mirrors ProductCategory
            ),
            delegate: SliverChildBuilderDelegate(
              (_, i) => _ServiceCard(listing: _kListings[i]),
              childCount: _kListings.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, double hPad) => Padding(
    padding: EdgeInsets.fromLTRB(hPad, AppSpacing.md, hPad, AppSpacing.md),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Breadcrumb
        Row(children: [
          const Icon(Icons.home_outlined,
              size: 15, color: AppColors.textLight),
          const Icon(Icons.chevron_right,
              size: 15, color: AppColors.textLight),
          Text(query,
              style: AppTextStyles.cardSub()
                  .copyWith(color: AppColors.textMid)),
        ]),
        const SizedBox(height: AppSpacing.sm),
        // Title + result count pill — AppTextStyles.sectionTitle matches site
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: AppSpacing.sm,
          children: [
            Text(query, style: AppTextStyles.sectionTitle(context)),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm + 2, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Text(
                '$totalCount Products and services',
                style: AppTextStyles.cardSub(),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
//  SERVICE CARD
//  • HoverCard           → white bg, border, radius sm, hover shadow+translate
//  • AppNetworkImage     → loading spinner + error state (shared_widgets)
//  • AppTextStyles       → cardTitle, cardSub, bodyText — all GoogleFonts.lato
//  • AppButton outlined  → lime-border CTA, matches existing AppButton exactly
// ─────────────────────────────────────────────────────────────────────────────

class _ServiceCard extends StatelessWidget {
  final ServiceListing listing;
  const _ServiceCard({required this.listing});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image — _kImageHeight, BoxFit.cover via AppNetworkImage
          SizedBox(
            height: _kImageHeight,
            child: AppNetworkImage(listing.imageUrl, height: _kImageHeight),
          ),

          // Text body — Expanded fills remaining card height
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                  AppSpacing.sm + 4, 3,
                  AppSpacing.sm + 4, 3),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  // Title — 2 lines max
                  Text(
                    listing.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardTitle(),
                  ),
                  const SizedBox(height: 4),

                  // Bullets — 3 lines max, tight line height
                  ...listing.bullets.take(3).map((b) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 2.5,
                            backgroundColor: AppColors.textLight),
                        const SizedBox(width: AppSpacing.xs + 2),
                        Expanded(
                          child: Text(b,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.cardSub(),
                          ),
                        ),
                      ],
                    ),
                  )),

                  const SizedBox(height: 4),

                  // Company row
                  Row(children: [
                    Text(listing.countryFlag,
                        style: const TextStyle(fontSize: 13)),
                    const SizedBox(width: AppSpacing.xs + 2),
                    Expanded(
                      child: Text(
                        listing.companyName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.cardSub().copyWith(fontSize: 11),
                      ),
                    ),
                    if (listing.verified)
                      const Icon(Icons.verified,
                          color: AppColors.lime, size: 14),
                    if (listing.respondsReliably) ...[
                      const SizedBox(width: AppSpacing.xs),
                      const Icon(Icons.chat_bubble_outline,
                          color: AppColors.lime, size: 14),
                    ],
                  ]),

                  // Price (only if present — tight spacing)
                  if (listing.priceRange != null) ...[
                    const SizedBox(height: 3),
                    Text(
                      listing.priceRange!,
                      style: GoogleFonts.lato(
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                  if (listing.minOrder != null)
                    Text(
                      'Minimum order: ${listing.minOrder}',
                      style: AppTextStyles.cardSub().copyWith(fontSize: 10),
                    ),

                  const SizedBox(height: 2),

                  // CTA inside the fixed height box — never overflows
                  AppButton(
                    label: 'Contact supplier',
                    outlined: true,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            ))
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  FILTER SIDEBAR
// ─────────────────────────────────────────────────────────────────────────────

class _FilterSidebar extends StatefulWidget {
  final List<_FilterGroup> filters;
  final VoidCallback onReset;
  final VoidCallback onChanged;
  final ScrollController? scrollController;

  const _FilterSidebar({
    required this.filters,
    required this.onReset,
    required this.onChanged,
    this.scrollController,
  });

  @override
  State<_FilterSidebar> createState() => _FilterSidebarState();
}

class _FilterSidebarState extends State<_FilterSidebar> {
  double _radius = 50;
  final _minCtrl = TextEditingController(text: '0');
  final _maxCtrl = TextEditingController(text: '100000000');

  @override
  void dispose() {
    _minCtrl.dispose();
    _maxCtrl.dispose();
    super.dispose();
  }

  // Shared input decoration — matches hero_section _SearchBar border style
  InputDecoration _inputDeco(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: AppTextStyles.bodyText().copyWith(color: AppColors.textLight),
    contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm + 4, vertical: 9),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.xs),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.xs),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.xs),
      borderSide: const BorderSide(color: AppColors.lime),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: ListView(
        controller: widget.scrollController,
        padding: const EdgeInsets.only(bottom: AppSpacing.xl),
        children: [
          // Header — AppTextStyles.sectionTitle
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, AppSpacing.md,
                AppSpacing.md, AppSpacing.sm),
            child: Text('Filters',
                style: AppTextStyles.sectionTitle(context)),
          ),
          const AppDivider(), // AppDivider from shared_widgets

          ...widget.filters.map(_buildGroup),
          _buildNearMe(),
          _buildPriceRange(),

          const SizedBox(height: AppSpacing.md),

          // Reset — AppButton outlined (shared_widgets)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: AppButton(
              label: 'Reset all filters',
              outlined: true,
              bg: AppColors.border,
              fg: AppColors.textMid,
              onTap: widget.onReset,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroup(_FilterGroup group) => Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      initiallyExpanded: true,
      tilePadding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      title: Text(group.title,
          style: AppTextStyles.cardTitle().copyWith(fontSize: 13)),
      iconColor: AppColors.textDark,
      collapsedIconColor: AppColors.textDark,
      childrenPadding: const EdgeInsets.only(bottom: AppSpacing.xs),
      children: group.options.map(_buildCheckbox).toList(),
    ),
  );

  Widget _buildCheckbox(_FilterOption opt) => InkWell(
    onTap: () {
      setState(() => opt.selected = !opt.selected);
      widget.onChanged();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md, vertical: AppSpacing.xs),
      child: Row(children: [
        SizedBox(
          width: 18, height: 18,
          child: Checkbox(
            value: opt.selected,
            onChanged: (v) {
              setState(() => opt.selected = v ?? false);
              widget.onChanged();
            },
            activeColor: AppColors.lime,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(color: AppColors.border),
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            '${opt.label} (${opt.count})',
            style: AppTextStyles.bodyText()
                .copyWith(fontSize: 12.5, color: AppColors.textMid),
          ),
        ),
      ]),
    ),
  );

  Widget _buildNearMe() => Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      initiallyExpanded: true,
      tilePadding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Near me',
              style: AppTextStyles.cardTitle().copyWith(fontSize: 13)),
          GestureDetector(
            onTap: () {},
            child: Text('Reset',
                style: AppTextStyles.cardSub()
                    .copyWith(color: AppColors.textMid)),
          ),
        ],
      ),
      iconColor: AppColors.textDark,
      collapsedIconColor: AppColors.textDark,
      childrenPadding: const EdgeInsets.fromLTRB(
          AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
      children: [
        TextField(
          decoration: _inputDeco('City or postal code'),
          style: AppTextStyles.bodyText(),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(children: [
          const Icon(Icons.my_location, color: AppColors.lime, size: 15),
          const SizedBox(width: AppSpacing.xs + 1),
          Text('Use my location',
              style: AppTextStyles.bodyText().copyWith(
                color: AppColors.lime,
                fontWeight: FontWeight.w700,
                fontSize: 13,
              )),
        ]),
        const SizedBox(height: AppSpacing.sm),
        Text('Radius(km):', style: AppTextStyles.cardSub()),
        SliderTheme(
          data: SliderThemeData(
            activeTrackColor: AppColors.lime,
            thumbColor: AppColors.lime,
            inactiveTrackColor: AppColors.border,
            overlayColor: AppColors.lime.withOpacity(0.15),
            trackHeight: 2,
            thumbShape:
                const RoundSliderThumbShape(enabledThumbRadius: 7),
          ),
          child: Slider(
            value: _radius,
            min: 10, max: 250,
            onChanged: (v) => setState(() => _radius = v),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: ['10', '25', '50', '75', '100', '125', '250']
              .map((l) => Text(l,
                  style: AppTextStyles.cardSub()
                      .copyWith(fontSize: 9.5)))
              .toList(),
        ),
      ],
    ),
  );

  Widget _buildPriceRange() => Theme(
    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
    child: ExpansionTile(
      initiallyExpanded: true,
      tilePadding:
          const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Price range (EUR)',
              style: AppTextStyles.cardTitle().copyWith(fontSize: 13)),
          GestureDetector(
            onTap: () {},
            child: Text('Reset',
                style: AppTextStyles.cardSub()
                    .copyWith(color: AppColors.textMid)),
          ),
        ],
      ),
      iconColor: AppColors.textDark,
      collapsedIconColor: AppColors.textDark,
      childrenPadding: const EdgeInsets.fromLTRB(
          AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
      children: [
        Row(children: [
          Expanded(
            child: TextField(
              controller: _minCtrl,
              keyboardType: TextInputType.number,
              style: AppTextStyles.bodyText(),
              decoration: _inputDeco('Minimum'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm),
            child: Text('–', style: AppTextStyles.bodyText()),
          ),
          Expanded(
            child: TextField(
              controller: _maxCtrl,
              keyboardType: TextInputType.number,
              style: AppTextStyles.bodyText(),
              decoration: _inputDeco('Maximum'),
            ),
          ),
        ]),
      ],
    ),
  );
}