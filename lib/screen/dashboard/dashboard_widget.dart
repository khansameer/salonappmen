import 'package:flutter/material.dart';

import '../../core/constants/color_utils.dart';
import '../../core/constants/image_utils.dart';
import '../../core/widgets/component.dart';

Widget topBannerView() {
  return ListView.builder(
    itemCount: 5,
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: commonBoxDecoration(
          image: DecorationImage(
            fit: .cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withValues(alpha: 0.4),
              BlendMode.darken,
            ),
            // opacity: 0.5,
            image: AssetImage(icIntro1),
          ),
          borderRadius: 16,
        ),
        height: 100,
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
                      textAlign: TextAlign.center,
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
  );
}

Widget hairTypeView() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),

    child: Column(
      mainAxisAlignment: .center,
      crossAxisAlignment: .start,
      children: [
        commonText(
          text: "What are you looking for today ?",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 120, // 🔥 increase height
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,

            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 0,right: 10),
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: commonBoxDecoration(
                        color: colorBannerButton.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: commonAssetImage(icIntro1,width: 40,height: 40),
                      ),
                    ),
                    Flexible(child: commonText(text: "Sameer")),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
