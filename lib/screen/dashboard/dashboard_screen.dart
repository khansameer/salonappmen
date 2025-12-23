import 'package:flutter/material.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/widgets/component.dart';

import 'dashboard_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      appBar: commonAppBar(
        title: "",
        leading: SizedBox.shrink(),
        context: context,
        flexibleSpace: appBarView(),
      ),
      body: ListView(
        children: [
          Container(height: 157, color: colorBannerBg, child: topBannerView()),
          Container(height: 191, color: Colors.white,child: hairTypeView(),),
          Container(height: 226, color: colorBannerBg1),
          Container(height: 226, color: Colors.white),
        ],
      ),
    );
  }


}
