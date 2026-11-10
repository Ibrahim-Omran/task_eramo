import '../../../core/utils/app_assets.dart';

class PropertyModel {
  final String image, price, title, area, location, time;
  final int beds, baths;
  final bool featured, isProject;
  const PropertyModel({
    required this.image,
    this.price = '4,000,000 ج.م',
    required this.title,
    this.area = '8,725sqft',
    this.location = 'الشيخ زايد الجيزة',
    this.time = 'منذ 4 ايام',
    this.beds = 10,
    this.baths = 5,
    this.featured = false,
    this.isProject = false,
  });
}

class CityModel {
  final String name, image;
  final int forSale, forRent;
  const CityModel(this.name, this.image, this.forSale, this.forRent);
}

class HomeData {
  static const featured = [
    PropertyModel(image: AppAssets.apartment, title: 'شقة سكنية للبيع تشطيب سوبر ...', featured: true),
    PropertyModel(image: AppAssets.villa, title: 'فيلا سكنية للبيع تشطيب سوبر ...', featured: true),
  ];
  static const projects = [
    PropertyModel(image: AppAssets.project, title: 'كمبوند الشيخ زايد', isProject: true),
    PropertyModel(image: AppAssets.project, title: 'كمبوند الشيخ زايد', isProject: true),
  ];
  static const apartments = [
    PropertyModel(image: AppAssets.apartment, title: 'شقة سكنية للبيع تشطيب سوبر ...'),
    PropertyModel(image: AppAssets.apartment, title: 'شقة سكنية للبيع تشطيب سوبر ...'),
  ];
  static const villas = [
    PropertyModel(image: AppAssets.villa, title: 'فيلا سكنية للبيع تشطيب سوبر ...'),
    PropertyModel(image: AppAssets.villa, title: 'فيلا سكنية للبيع تشطيب سوبر ...'),
  ];
  static const duplexes = [
    PropertyModel(image: AppAssets.duplex, title: 'دوبلكس للبيع تشطيب سوبر ...'),
    PropertyModel(image: AppAssets.duplex, title: 'دوبلكس للبيع تشطيب سوبر ...'),
  ];
  static const cities = [
    CityModel('القاهرة', AppAssets.cityCairo, 505, 1002),
    CityModel('الجيزة', AppAssets.cityGiza, 505, 1002),
  ];
  static const banners = [AppAssets.banner, AppAssets.banner, AppAssets.banner, AppAssets.banner];
}
