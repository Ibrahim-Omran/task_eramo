
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../data/home_data.dart';

class PropertyCardComponent extends StatelessWidget {
  final PropertyModel item;

  const PropertyCardComponent({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final color = item.isProject
        ? AppColors.green
        : AppColors.yellow;

    return Container(
      width: 229,
      height: 308,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: color),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 124,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),

                // Left Tag
                if (!item.isProject)
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: _Tag(
                      text: 'للبيع',
                      bg: AppColors.yellow,
                      fg: AppColors.primary,
                    ),
                  ),

                // Right Badge
                if (item.isProject)
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: _FeaturedBadge(
                      text: 'مشروع',
                      isProject: true,
                    ),
                  )
                else if (item.featured)
                  const Positioned(
                    right: 0,
                    bottom: 0,
                    child: _FeaturedBadge(
                      text: 'مميز',
                    ),
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.isProject ? item.title : item.price,
                      style: item.isProject
                          ? AppTextStyles.cardTitleBold
                          : AppTextStyles.price,
                    ),
                    const Icon(
                      Icons.favorite,
                      color: AppColors.red,
                      size: 20,
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                Text(
                  item.isProject
                      ? 'شقق سكنية فاخرة ومطاعم تجار...'
                      : item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.cardTitle,
                ),

                if (!item.isProject) ...[
                  const SizedBox(height: 10),
                  _Specs(item: item),
                ],

                const SizedBox(height: 10),

                _InfoRow(
                  icon: Icons.location_on,
                  text: item.location,
                ),

                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _InfoRow(
                      icon: Icons.access_time,
                      text: item.time,
                    ),
                    const _ByAgent(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Horizontal Property Card

class PropertyHorizontalCardComponent extends StatelessWidget {
  final PropertyModel item;

  const PropertyHorizontalCardComponent({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 377,
      height: 169,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          SizedBox(
            width: 156,
            height: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  item.image,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  left: 0,
                  top: 7,
                  child: _Tag(
                    text: 'للبيع',
                    bg: Color(0xFFE4E4E4),
                    fg: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.price,
                        style: AppTextStyles.price,
                      ),
                      const Icon(
                        Icons.favorite,
                        color: AppColors.red,
                        size: 20,
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.cardTitle,
                  ),

                  const SizedBox(height: 10),

                  _Specs(item: item),

                  const SizedBox(height: 8),

                  const _InfoBorderIfNeeded(),

                  _InfoRow(
                    icon: Icons.location_on,
                    text: item.location,
                  ),

                  const Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _InfoRow(
                        icon: Icons.access_time,
                        text: item.time,
                      ),
                      const _ByAgent(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Tag

class _Tag extends StatelessWidget {
  final String text;
  final Color bg;
  final Color fg;
  final IconData? icon;

  const _Tag({
    required this.text,
    required this.bg,
    required this.fg,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fg),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTextStyles.tag.copyWith(color: fg),
          ),
        ],
      ),
    );
  }
}

// Featured / Project Badge

class _FeaturedBadge extends StatelessWidget {
  final String text;
  final bool isProject;

  const _FeaturedBadge({
    this.text = 'مميز',
    this.isProject = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: isProject
            ? AppColors.green
            : AppColors.yellow,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTextStyles.small.copyWith(
              color: isProject ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          if (!isProject) ...[
            const SizedBox(width: 4),
            const Icon(
              Icons.star,
              size: 13,
              color: Colors.black,
            ),
          ],
        ],
      ),
    );
  }
}

// Property Specs

class _Specs extends StatelessWidget {
  final PropertyModel item;

  const _Specs({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _InfoRow(
          icon: Icons.bed_outlined,
          text: '${item.beds}',
          iconFirst: false,
        ),
        _InfoRow(
          icon: Icons.bathtub_outlined,
          text: '${item.baths}',
          iconFirst: false,
        ),
        _InfoRow(
          icon: Icons.crop_free,
          text: item.area,
          iconFirst: false,
        ),
      ],
    );
  }
}

// Info Row

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool iconFirst;

  const _InfoRow({
    required this.icon,
    required this.text,
    this.iconFirst = true,
  });

  @override
  Widget build(BuildContext context) {
    final i = Icon(
      icon,
      size: 15,
      color: AppColors.grey,
    );

    final t = Text(
      text,
      style: AppTextStyles.small,
    );

    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      children: iconFirst
          ? [i, const SizedBox(width: 4), t]
          : [t, const SizedBox(width: 4), i],
    );
  }
}

// Placeholder

class _InfoBorderIfNeeded extends StatelessWidget {
  const _InfoBorderIfNeeded();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

// Agent

class _ByAgent extends StatelessWidget {
  const _ByAgent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'بواسطة',
          style: AppTextStyles.small.copyWith(fontSize: 10),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            AppAssets.gsLogo,
            width: 40,
            height: 28,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
