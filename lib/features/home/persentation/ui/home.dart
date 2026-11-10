import 'package:flutter/material.dart';
import '../../data/home_data.dart';
import '../component/app_bar_component.dart';
import '../component/app_baner_component.dart';
import '../component/bottom_nav_component.dart';
import '../component/city_card_component.dart';
import '../component/news_card_component.dart';
import '../component/property_card_component.dart';
import '../component/search_component.dart';
import '../component/section_header_component.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavComponent(),
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const AppBarComponent(),
            const SearchComponent(),
            const AppBanerComponent(),
            const SizedBox(height: 40),

            const SectionHeaderComponent(
                title: 'عقارات مميزة في مصر', showTabs: true
            ),
            _hList(
                308,HomeData.featured.map((e) => PropertyCardComponent(item: e)).toList()),

            const SectionHeaderComponent(title: 'اهم المشاريع العقارية في مصر'),
            _hList(308, HomeData.projects.map((e) => PropertyCardComponent(item: e)).toList()),

            const SectionHeaderComponent(title: 'إبحث عن عقارك بالمدينة'),
            _hList(249, HomeData.cities.map((e) => CityCardComponent(city: e)).toList()),

            const AppBanerComponent(),
            const SizedBox(height: 32),

            const SectionHeaderComponent(title: 'أحدث الشقق في مصر', showTabs: true),
            _hList(200, HomeData.apartments.map((e) => PropertyHorizontalCardComponent(item: e)).toList()),

            const SectionHeaderComponent(title: 'أحدث الفيلات في مصر', showTabs: true),
            _hList(200, HomeData.villas.map((e) => PropertyHorizontalCardComponent(item: e)).toList()),

            const SectionHeaderComponent(title: 'أحدث الدوبلكس في مصر', showTabs: true),
            _hList(200, HomeData.duplexes.map((e) => PropertyHorizontalCardComponent(item: e)).toList()),
            const SectionHeaderComponent(title: 'اهم الأخبار'),
            _hList(256, const [NewsCardComponent(), NewsCardComponent()]),
          ],
        ),
      ),
    );
  }

  Widget _hList(double height, List<Widget> children) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: SizedBox(
          height: height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 23),
            itemCount: children.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, i) => children[i],
          ),
        ),
      );
}
