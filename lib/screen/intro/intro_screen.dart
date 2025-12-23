import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/routes/app_routes.dart';

import '../../core/widgets/component.dart';
import '../../local/app_config_cache.dart';
import '../../provider/onboarding_provider.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  final PageController _pageController = PageController();

  static const double _horizontalPadding = 24;
  static const double _buttonHeight = 45;

  final List<Map<String, String>> _pages = const [
    {
      "title": "Best Stylist For You",
      "desc": "Styling your appearance\naccording to your lifestyle",
      "img": icIntro1,
    },
    {
      "title": "Meet Our Specialists",
      "desc": "There are many best stylists from\nall the best salons ever",
      "img": icIntro2,
    },
    {
      "title": "Find The Best Service",
      "desc":
      "Experience top-notch grooming and style\ntailored at our premium men's salon",
      "img": icIntro3,
    },
    {
      "title": "Let’s Join with Us",
      "desc": "Find and book Salon and Barber\nservices anytime",
      "img": icIntro4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      body: Consumer<OnboardingProvider>(
        builder: (context, provider, _) {
          final bool isLastPage =
              provider.currentIndex == _pages.length - 1;

          return Stack(
            children: [
              /// Background Image
              Positioned.fill(
                child: Image.asset(
                  _pages[provider.currentIndex]["img"]!,
                  fit: BoxFit.cover,
                ),
              ),

              /// Dark Overlay
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),

              /// Content
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: _horizontalPadding),
                child: Column(
                  children: [
                    /// Pages
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: _pages.length,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: provider.setPage,
                        itemBuilder: (_, index) =>
                            _buildPage(_pages[index]),
                      ),
                    ),

                    const SizedBox(height: 32),

                    /// Indicators
                    _buildIndicators(provider.currentIndex),

                    const SizedBox(height: 32),

                    /// Button
                    commonButton(
                      height: _buttonHeight,
                      text: isLastPage ? "Get Started" : "Next",
                      onPressed: () =>
                          _handleNext(context, provider, isLastPage),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Handle Button Click
  Future<void> _handleNext(
      BuildContext context,
      OnboardingProvider provider,
      bool isLastPage,
      ) async {
    if (isLastPage) {
      await AppConfigCache.saveOnBoarding(true);
      Navigator.pushReplacementNamed(context,RouteName.loginScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Single Page UI
  Widget _buildPage(Map<String, String> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          commonText(
            text: data["title"]!,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          commonText(
            text: data["desc"]!,
            fontSize: 16,
            color: Colors.white70,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Page Indicators
  Widget _buildIndicators(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
            (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: index == currentIndex ? 22 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: index == currentIndex ? colorOrange : Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
