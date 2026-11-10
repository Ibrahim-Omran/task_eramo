import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle _base(double size, FontWeight w, Color c) =>
      GoogleFonts.almarai(fontSize: size, fontWeight: w, color: c);

  static final sectionTitle = _base(20, FontWeight.w700, AppColors.black);
  static final seeAll = _base(16, FontWeight.w400, AppColors.grey);
  static final tabActive = _base(14, FontWeight.w600, AppColors.black);
  static final tabInactive = _base(14, FontWeight.w400, AppColors.lightGrey);
  static final price = _base(16, FontWeight.w700, AppColors.black);
  static final cardTitle = _base(14, FontWeight.w400, AppColors.grey);
  static final cardTitleBold = _base(16, FontWeight.w700, AppColors.black);
  static final small = _base(12, FontWeight.w400, AppColors.dark);
  static final tag = _base(12, FontWeight.w500, AppColors.primary);
  static final hint = _base(16, FontWeight.w400, AppColors.grey);
  static final city = _base(18, FontWeight.w500, AppColors.black);
  static final bannerTitle = _base(15, FontWeight.w700, AppColors.white);
  static final bannerSub = _base(12, FontWeight.w400, AppColors.border);
  static final button = _base(13, FontWeight.w500, AppColors.black);
  static final navLabel = _base(12, FontWeight.w500, AppColors.dark);
}
