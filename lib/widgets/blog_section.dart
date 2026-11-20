// lib/widgets/blog_section.dart

import 'package:flutter/material.dart';
import '../config/app_config.dart';
import '../config/app_data.dart';
import 'shared_widgets.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      background: AppColors.pageBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Inside Business: The B2B blog from europages',
                        style: AppTextStyles.sectionTitle(context)),
                    Text('Most trending business topics for you',
                        style: AppTextStyles.bodyText()),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Go to Inside Business',
                    style: AppTextStyles.blogTitle()),
              ),
            ],
          ),
          SizedBox(height: AppSpacing.lg),
          ResponsiveGrid(
            mobileCols: 1,
            tabletCols: 2,
            desktopCols: 4,
            spacing: AppSpacing.md,
            children: kBlogPosts.map((p) => _BlogCard(post: p)).toList(),
          ),
        ],
      ),
    );
  }
}

class _BlogCard extends StatelessWidget {
  final BlogPost post;
  const _BlogCard({required this.post});

  @override
  Widget build(BuildContext context) => HoverCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(post.imageUrl, height: 160),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.blogTitle()),
                  SizedBox(height: AppSpacing.xs),
                  Text(post.excerpt,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.blogBody()),
                  SizedBox(height: AppSpacing.sm),
                  Text('Read more',
                      style: AppTextStyles.blogTitle()
                          .copyWith(fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      );
}
