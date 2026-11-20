# europages Flutter Web App

A pixel-perfect, fully responsive Flutter clone of the Europages B2B marketplace.
**100% overflow-free** on mobile, tablet, iPad, laptop, and widescreen desktop.

---

## 🗂 Project Structure

```
lib/
├── config/
│   ├── app_config.dart   ← ✅ ALL colors, spacing, fonts, breakpoints, theme
│   └── app_data.dart     ← ✅ ALL content/text/images in one place
├── widgets/
│   ├── shared_widgets.dart     ← Reusable atoms (Button, HoverCard, Grid…)
│   ├── navbar.dart             ← Sticky responsive nav + mobile hamburger
│   ├── hero_section.dart       ← Full-bleed hero + search bar
│   ├── stats_bar.dart          ← Dark green stats strip
│   ├── products_section.dart   ← Horizontal scroll product cards
│   ├── categories_section.dart ← Responsive category grid
│   ├── marketplace_cta.dart    ← Supplier + Request Hub cards
│   ├── blog_section.dart       ← Blog post grid
│   ├── app_banner.dart         ← App download banner
│   └── footer.dart             ← Full dark footer
├── screens/
│   └── home_screen.dart        ← Composes all sections
└── main.dart                   ← Entry point + ResponsiveFramework setup
```

---

## ⚙️ Setup

### Prerequisites
- Flutter SDK ≥ 3.0.0
- Chrome (for web preview)

### Install
```bash
cd europages_flutter
flutter pub get
```

### Run (web)
```bash
flutter run -d chrome
```

### Build for production
```bash
flutter build web --release
# Output: build/web/
```

---

## 🎨 Customization — Everything in ONE place

### Change Colors → `lib/config/app_config.dart`
```dart
class AppColors {
  static const Color lime      = Color(0xFF8DC63F); // ← change brand color here
  static const Color darkGreen = Color(0xFF1A3A2A); // ← nav/footer background
  // ...
}
```

### Change Spacing → same file
```dart
class AppSpacing {
  static const double md = 16.0;  // ← base unit
  static const double lg = 24.0;
  // ...
}
```

### Change Fonts → same file
```dart
// In AppTextStyles, swap GoogleFonts.lato() with any Google Font:
GoogleFonts.inter(...)
GoogleFonts.roboto(...)
```

### Change Breakpoints → same file
```dart
class AppBreakpoints {
  static const double mobile  = 480;
  static const double tablet  = 768;
  static const double desktop = 1200;
}
```

### Change Content/Images → `lib/config/app_data.dart`
```dart
const kStats = [
  StatItem(number: '2.2 million', label: 'B2B providers'),
  // ← edit/add stats here
];

const kCategories = [
  CategoryItem(
    name: 'Machine Tools',
    imageUrl: 'https://...', // ← swap any image
    count: 975,
  ),
  // ...
];
```

---

## 📱 Responsive System

Uses `responsive_framework` package — **no manual `if/else` breakpoint checks**.

| Breakpoint | Width      | Columns |
|------------|-----------|---------|
| Mobile     | < 480px   | 1–2     |
| Tablet     | 480–767px | 2–3     |
| Desktop    | 768–1199px| 3–4     |
| Wide       | ≥ 1200px  | 4–5     |

The `ResponsiveGrid` widget auto-calculates column count.
`AppSpacing.pagePadding(context)` auto-scales horizontal padding.
`AppTextStyles` auto-interpolates font sizes between breakpoints.

---

## 📦 Dependencies

| Package | Purpose |
|---------|---------|
| `responsive_framework` | Fluid breakpoints, no overflow |
| `google_fonts` | Lato font (no font files needed) |
| `flutter_staggered_animations` | Scroll-triggered reveal animations |
| `flutter_svg` | SVG icon support |
| `url_launcher` | Open external links |
