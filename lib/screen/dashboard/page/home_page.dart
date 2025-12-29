import 'package:flutter/material.dart';

import '../../../core/constants/color_utils.dart';
import '../../../core/widgets/component.dart';
import '../dashboard_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
      return ListView(

      children: [
        appBarView(),
        Container(
          color: colorBannerBg,
          child: topBannerView(),
        ),
        Container(
          color: Colors.white,
          child: hairTypeView(),
        ),
        Container(
          color: colorBannerBg1,
          child: specialistsView(),
        ),
        Container(
          color: Colors.white,
          child: galleryView(context),
        ),
        Container(
          color: colorBannerBg1,
          child: customerReviewView(),
        ),
        SizedBox(height: 56,)
      ],
    );
  }
}
