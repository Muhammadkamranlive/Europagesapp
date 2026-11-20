// lib/config/app_data.dart
// ─────────────────────────────────────
// All content/data in one place.
// Swap image URLs or text here freely.

class ProductItem {
  final String name;
  final String imageUrl;
  final String flag;
  const ProductItem({required this.name, required this.imageUrl, required this.flag});
}

class CategoryItem {
  final String name;
  final String imageUrl;
  final int count;
  const CategoryItem({required this.name, required this.imageUrl, required this.count});
}

class StatItem {
  final String number;
  final String label;
  const StatItem({required this.number, required this.label});
}

class BlogPost {
  final String title;
  final String excerpt;
  final String imageUrl;
  const BlogPost({required this.title, required this.excerpt, required this.imageUrl});
}

class FooterColumn {
  final String heading;
  final List<String> links;
  const FooterColumn({required this.heading, required this.links});
}

// ── CONTENT ───────────────────────────────────────────────────

const kStats = [
  StatItem(number: '2.2 million', label: 'B2B providers'),
  StatItem(number: '111',         label: 'Industry sectors'),
  StatItem(number: '670,000',     label: 'Products'),
  StatItem(number: '1.3 million', label: 'Pictures and videos'),
  StatItem(number: '1 million',   label: 'Buyers per month'),
];

const kProducts = [
  ProductItem(
    name: 'Steel Pipes – Fully Galvanized',
    imageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=400&q=80',
    flag: '🇩🇪',
  ),
  ProductItem(
    name: 'Ethicsport Hydrolyzed Collagen with Hyaluronic Acid',
    imageUrl: 'https://images.unsplash.com/photo-1607619056574-7b8d3ee536b2?w=400&q=80',
    flag: '🇮🇹',
  ),
  ProductItem(
    name: 'Protein Powder Supplement – Wholesale',
    imageUrl: 'https://images.unsplash.com/photo-1593095948071-474c5cc2989d?w=400&q=80',
    flag: '🇦🇹',
  ),
  ProductItem(
    name: 'Huile moteur semi-synthétique 5W-30',
    imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&q=80',
    flag: '🇫🇷',
  ),
  ProductItem(
    name: 'MoriVeda® NP-Vital Biocell Collagen Capsules',
    imageUrl: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400&q=80',
    flag: '🇦🇹',
  ),
  ProductItem(
    name: 'Premium Whey Protein Isolate – WPI 90%',
    imageUrl: 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=400&q=80',
    flag: '🇳🇱',
  ),
  ProductItem(
    name: 'Cold Drawn Steel Tubes',
    imageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=400&q=80',
    flag: '🇮🇹',
  ),
];

const kCategories = [
  CategoryItem(
    name: 'Mechanical Engineering & Plant Construction',
    imageUrl: 'https://images.unsplash.com/photo-1537462715879-360eeb61a0ad?w=400&q=80',
    count: 206,
  ),
  CategoryItem(
    name: 'Machine Tools and Equipment',
    imageUrl: 'https://images.unsplash.com/photo-1581091226033-d5c48150dbaa?w=400&q=80',
    count: 975,
  ),
  CategoryItem(
    name: 'Metal and Metal Products',
    imageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=400&q=80',
    count: 3215,
  ),
  CategoryItem(
    name: 'Construction',
    imageUrl: 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?w=400&q=80',
    count: 3239,
  ),
  CategoryItem(
    name: 'Repair, Maintenance and Modernization',
    imageUrl: 'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=400&q=80',
    count: 571,
  ),
  CategoryItem(
    name: 'Software',
    imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400&q=80',
    count: 3078,
  ),
  CategoryItem(
    name: 'Logistics, Transportation and Storage',
    imageUrl: 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=400&q=80',
    count: 857,
  ),
  CategoryItem(
    name: 'Electrical Engineering',
    imageUrl: 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400&q=80',
    count: 3061,
  ),
  CategoryItem(
    name: 'Packaging Material',
    imageUrl: 'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da?w=400&q=80',
    count: 3072,
  ),
  CategoryItem(
    name: 'Machine Parts',
    imageUrl: 'https://images.unsplash.com/photo-1537462715879-360eeb61a0ad?w=400&q=80',
    count: 2670,
  ),
  CategoryItem(
    name: 'Food and Beverage',
    imageUrl: 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=400&q=80',
    count: 1300,
  ),
  CategoryItem(
    name: 'Industrial Supplies',
    imageUrl: 'https://images.unsplash.com/photo-1504917595217-d4dc5ebe6122?w=400&q=80',
    count: 3100,
  ),
];

const kBlogPosts = [
  BlogPost(
    title: 'Will the EU–Australia Trade Deal Change How EU B2B Companies Approach…',
    excerpt: 'The European Union and Australia have reached a long-anticipated Free Trade Agreement (FTA),…',
    imageUrl: 'https://images.unsplash.com/photo-1557804506-669a67965ba0?w=400&q=80',
  ),
  BlogPost(
    title: 'How the US–Iran conflict is creating a supply chain disruption in EU B2B trading',
    excerpt: 'At first, the US–Iran conflict may seem far away. But for European B2B companies, it is already having…',
    imageUrl: 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=400&q=80',
  ),
  BlogPost(
    title: 'Building trust across borders: How COMERCIAL FILCOR turned textile expertise…',
    excerpt: 'For Spanish textile expert COMERCIAL FILCOR, growth has never been about scale alone. As a…',
    imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&q=80',
  ),
  BlogPost(
    title: 'Why UK vehicle production targets matter for B2B suppliers',
    excerpt: 'The government wants to almost double UK vehicle production to 1.3 million vehicles a year…',
    imageUrl: 'https://images.unsplash.com/photo-1581091226033-d5c48150dbaa?w=400&q=80',
  ),
];

const kFooterColumns = [
  FooterColumn(heading: 'For Buyers', links: [
    'Request for Quotes',
    'Inside Business',
    'Help Center for Buyers',
    'Buyers Success Stories',
  ]),
  FooterColumn(heading: 'For Suppliers', links: [
    'List your company',
    'Visable Media Services',
    'Help Center for Suppliers',
    'Suppliers Success Stories',
  ]),
  FooterColumn(heading: 'More about Visable', links: [
    'Press',
    'Contact',
    'Career',
    'About us',
  ]),
];
