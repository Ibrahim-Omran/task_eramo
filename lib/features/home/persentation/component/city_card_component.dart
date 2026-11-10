import 'package:flutter/material.dart';
import '../../../../core/utils/text_styles.dart';
import '../../data/home_data.dart';

class CityCardComponent extends StatelessWidget {
  final CityModel city;
  const CityCardComponent({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final white = AppTextStyles.small.copyWith(color: Colors.white);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 185,
        height: 249,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(city.image, fit: BoxFit.cover),
            Container(color: Colors.black26),
            Center(
              child: Text(city.name,
                  style: AppTextStyles.cardTitleBold.copyWith(color: Colors.white, fontSize: 18)),
            ),
            Positioned(
              right: 12,
              bottom: 14,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('عقارات للبيع : ${city.forSale}', style: white),
                  const SizedBox(height: 8),
                  Text('عقارات للإيجار : ${city.forRent}', style: white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
