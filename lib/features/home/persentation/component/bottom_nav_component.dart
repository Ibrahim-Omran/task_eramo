import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // استيراد حزمة الـ SVG
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/utils/app_assets.dart'; // التأكد من استيراد مسارات الأصول

class BottomNavComponent extends StatelessWidget {
  const BottomNavComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 66,
            margin: const EdgeInsets.fromLTRB(18, 0, 18, 12),
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _item(AppAssets.developer, 'المطورون'),
                _item(AppAssets.shop, 'السوق'),
                const SizedBox(width: 63), // مساحة للزر البارز في المنتصف
                _item(AppAssets.pffers, 'العروض'),
                _item(AppAssets.myProperties, 'عقاراتى'),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: 67,
              height: 67,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.home,
                  width: 30,
                  height: 30,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(String assetPath, String label) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        assetPath,
        width: 24,
        height: 24,
        colorFilter: const ColorFilter.mode(
          AppColors.dark,
          BlendMode.srcIn,
        ),
      ),
      const SizedBox(height: 4),
      Text(label, style: AppTextStyles.navLabel),
    ],
  );
}