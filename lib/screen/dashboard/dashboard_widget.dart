import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/provider/dashboard_provider.dart';

import '../../core/constants/color_utils.dart';
import '../../core/constants/image_utils.dart';
import '../../core/widgets/star_display.dart';
import '../../core/widgets/component.dart';

Widget topBannerView() {
  return SizedBox(
    height: 150,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: commonBoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withValues(alpha: 0.4),
                BlendMode.darken,
              ),
              image: AssetImage(icIntro1),
            ),
            borderRadius: 16,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),

            child: Row(
              children: [
                Expanded(
                  child: Column(
                    spacing: 8,
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      commonText(
                        color: colorWhite,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w700,
                        text: "Look more stylish and\nearn more discount",
                      ),
                      Row(
                        mainAxisSize: .min,
                        children: [
                          Container(
                            height: 29,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: commonBoxDecoration(
                              color: colorBannerButton,
                              borderRadius: 16,
                            ),
                            child: Center(
                              child: commonText(
                                text: "Get Offer Now !",
                                fontSize: 13,
                                color: colorBannerText,
                                fontWeight: .w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 73,
                  alignment: .center,
                  height: 73,
                  decoration: commonBoxDecoration(
                    shape: .circle,
                    color: colorBannerCircle.withValues(alpha: 0.9),
                  ),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .center,
                    children: [
                      commonText(
                        color: colorTextMarron,
                        textAlign: TextAlign.center,
                        text: "Up to",
                        fontSize: 12,
                      ),
                      commonText(
                        text: "50%",
                        color: colorTextMarron,
                        textAlign: TextAlign.center,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

Widget hairTypeView() {
  return Consumer<DashboardProvider>(
    builder: (context, provider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              text: "What are you looking for today ?",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 0),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.topList.length,
                itemBuilder: (context, index) {
                  var data = provider.topList[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: commonBoxDecoration(
                            color: colorBannerButton.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: commonAssetImage(
                              data['icon'],
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        commonText(
                          text: data['title'],
                          fontWeight: FontWeight.w500,
                          color: colorTextTopList,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget specialistsView() {
  return Consumer<DashboardProvider>(
    builder: (context, provider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText(
              text: "Your Favorite Specialists",
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.topSpecialistsList.length,
              itemBuilder: (context, index) {
                var data = provider.topSpecialistsList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: commonBoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: commonBoxDecoration(
                          color: colorBannerButton.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: commonAssetImage(data['icon']),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                              text: data['name'],
                              fontWeight: FontWeight.w600,
                            ),
                            commonText(
                              text: data['time'],
                              fontSize: 12,
                              color: colorTextLight,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: commonBoxDecoration(
                          color: data['status']
                              ? Colors.green.withOpacity(0.2)
                              : Colors.red.withOpacity(0.2),
                        ),
                        child: commonText(
                          text: data['status'] ? "Available" : "Not Available",
                          fontSize: 10,
                          color: data['status'] ? Colors.green : Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

Widget galleryView(BuildContext context) {
  return Consumer<DashboardProvider>(
    builder: (context, provider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: commonText(
                    text: "Gallery",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                commonText(
                  text: "View All",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.galleryList.length,
                itemBuilder: (context, index) {
                  var data = provider.galleryList[index];
                  return Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: commonBoxDecoration(borderRadius: 12),
                    clipBehavior: Clip.antiAlias,
                    child: commonAssetImage(data['icon'], fit: BoxFit.cover),
                  );
                },
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget customerReviewView() {
  return Consumer<DashboardProvider>(
    builder: (context, provider, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: commonText(
                    text: "Customer Reviews",
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                commonText(
                  text: "View All",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: provider.customerReviewList.length,
              itemBuilder: (context, index) {
                var data = provider.customerReviewList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: commonBoxDecoration(color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: commonBoxDecoration(
                          shape: BoxShape.circle,
                          color: colorBannerButton.withOpacity(0.5),
                        ),
                        child: commonAssetImage(data['icon']),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonText(
                              text: data['name'],
                              fontWeight: FontWeight.w600,
                            ),
                            commonText(
                              text: data['desc'],
                              fontSize: 12,
                              color: colorTextLight,
                            ),
                            StarDisplay(value:  data['rating'],)

                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
