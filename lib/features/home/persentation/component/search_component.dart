
import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.fromLTRB(23, 14, 23, 16),
      child: Container(
        height: 42,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.searchBg,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.hint,
                decoration: InputDecoration(
                  hintText: 'كيف يمكننا مساعدتك',
                  hintStyle: AppTextStyles.hint,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  isDense: true,
                ),
              ),
            ),
            const Icon(
              Icons.search,
              color: AppColors.grey,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
