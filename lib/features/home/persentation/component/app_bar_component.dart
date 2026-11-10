import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(23, 8, 23, 0),
      child: Column(
        children: [
          Image.asset(AppAssets.logo, height: 28),
          const SizedBox(height: 28),
          Row(
            children: [
              Row(children: [
                Text('القاهرة', style: AppTextStyles.city),
                const Icon(Icons.keyboard_arrow_down, size: 24),
              ]),
              const Spacer(),
              _badgeIcon(AppAssets.message, '5'),
              const SizedBox(width: 14),
              _badgeIcon(AppAssets.notification, '2'),
              const SizedBox(width: 14),
              SvgPicture.asset(AppAssets.menu, width: 34),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badgeIcon(String asset, String count) => Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(asset, width: 32, height: 32),
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              width: 15,
              height: 15,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.red,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white),
              ),
              child: Text(count,
                  style: const TextStyle(color: Colors.white, fontSize: 9)),
            ),
          ),
        ],
      );
}
