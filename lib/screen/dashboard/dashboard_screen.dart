import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/widgets/component.dart';
import 'package:salonman/provider/dashboard_provider.dart';
import 'package:salonman/screen/dashboard/page/home_page.dart';

import '../../core/widgets/common_bottom_navbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return Container();
      case 2:
        return Container();
      case 3:
        return Container();
      case 4:
        return Container();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, _) {
        return commonScaffold(
          bottomNavigationBar: CommonBottomNavBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.setIndex(index);

              switch (index) {
                case 0: // Product

                  break;
                case 1: // Order

                  break;
                case 2: // Home

                  break;
                case 3: // Customer

                  break;
              }

              if (index == 0) provider.setAppBarTitle("Home");
              if (index == 1) provider.setAppBarTitle("Book");
              if (index == 2) provider.setAppBarTitle("Chat");
              if (index == 3) provider.setAppBarTitle("Profile");
            },
            items: BottomNavItems.items,
          ),
          appBar: commonAppBar(
            title: provider.appbarTitle ?? "Home",
            leading: Center(
              child: commonAssetImage(icMen, width: 32, height: 32),
            ),
            context: context,
            // flexibleSpace: appBarView(),
          ),
          body: Stack(
            children: [
              getPage(provider.currentIndex),
              Align(
                alignment: .bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  height: 45,

                  decoration: commonBoxDecoration(
                    color: colorBg,
                    borderRadius: 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(

                      children: [
                        Expanded(child: commonText(color: Colors.white, text: "Book Service?")),

                        Container(
                          decoration: commonBoxDecoration(
                            color: Colors.white.withValues(alpha: 0.3),
                            borderRadius: 32,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 3,
                          ),
                          child: commonText(
                            text: "Yes",
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
