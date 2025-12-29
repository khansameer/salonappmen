import 'package:flutter/material.dart';

import '../constants/color_utils.dart';

class StarDisplay extends StatelessWidget {
  final int value;

  const StarDisplay({super.key, this.value = 0}) : assert(value != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          color: colorRating,
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}
