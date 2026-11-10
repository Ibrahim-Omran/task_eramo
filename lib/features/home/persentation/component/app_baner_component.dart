import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../data/home_data.dart';

class AppBanerComponent extends StatefulWidget {
  const AppBanerComponent({super.key});

  @override
  State<AppBanerComponent> createState() => _AppBanerComponentState();
}

class _AppBanerComponentState extends State<AppBanerComponent> {
  final _controller = PageController();
  int _index = 0;

  void _go(int i) => _controller.animateToPage(
        i.clamp(0, HomeData.banners.length - 1),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            children: [
              PageView.builder(
                controller: _controller,
                itemCount: HomeData.banners.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(HomeData.banners[i], fit: BoxFit.cover),
                    Container(color: Colors.black45),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('منزل احلامك الآن متوفر', style: AppTextStyles.bannerTitle),
                        const SizedBox(height: 6),
                        Text('مشروع كمبوند الشيخ زايد اكثر من 200 شقة\nومحل في انتظارك',
                            textAlign: TextAlign.center, style: AppTextStyles.bannerSub),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.yellow,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text('تواصل الآن', style: AppTextStyles.button),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(right: 8, top: 55, child: _arrow(Icons.chevron_right, () => _go(_index - 1))),
              Positioned(left: 8, top: 55, child: _arrow(Icons.chevron_left, () => _go(_index + 1))),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Dots(count: HomeData.banners.length, index: _index),
      ],
    );
  }

  Widget _arrow(IconData icon, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
      );
}

class Dots extends StatelessWidget {
  final int count, index;
  const Dots({super.key, required this.count, required this.index});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          count,
          (i) => Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: i == index ? AppColors.primary : AppColors.border,
            ),
          ),
        ),
      );
}
