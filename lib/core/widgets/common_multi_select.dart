
import 'package:flutter/material.dart';
import 'package:salonman/core/widgets/component.dart';

import '../constants/color_utils.dart';

class CommonMultiSelectWrap extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(String) onTap;

  const CommonMultiSelectWrap({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onTap,
  });


  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 12,
      children: items.map((item) {
        final isSelected = selectedItems.contains(item);

        return FilterChip(
          padding: EdgeInsets.zero,
          checkmarkColor: colorChipBorderColor,
          selectedColor: colorChips,
          shape: StadiumBorder(
            side: BorderSide(

              color: isSelected
                  ? colorChipBorderColor
                  : Colors.grey.shade300,
              width: 1.2,
            ),
          ),
          backgroundColor: Colors.white,
          label: commonText(text: item),
          selected: isSelected,
          onSelected: (_) => onTap(item),
        );
      }).toList(),
    );
  }
}
