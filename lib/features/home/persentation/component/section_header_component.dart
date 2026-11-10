import 'package:flutter/material.dart';
import '../../../../core/utils/text_styles.dart';

class SectionHeaderComponent extends StatefulWidget {
  final String title;
  final bool showTabs;
  const SectionHeaderComponent({super.key, required this.title, this.showTabs = false});

  @override
  State<SectionHeaderComponent> createState() => _SectionHeaderComponentState();
}

class _SectionHeaderComponentState extends State<SectionHeaderComponent> {
  int _tab = 0;
  static const _tabs = ['الكل', 'للبيع', 'للإيجار'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(widget.title, style: AppTextStyles.sectionTitle)),
              Text('مشاهدة الكل', style: AppTextStyles.seeAll),
            ],
          ),
          if (widget.showTabs) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                for (int i = 0; i < _tabs.length; i++) ...[
                  GestureDetector(
                    onTap: () => setState(() => _tab = i),
                    child: Text(_tabs[i],
                        style: _tab == i ? AppTextStyles.tabActive : AppTextStyles.tabInactive),
                  ),
                  if (i != _tabs.length - 1)
                    Container(
                      width: 1,
                      height: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.grey.shade400,
                    ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
