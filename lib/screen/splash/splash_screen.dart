import 'package:flutter/material.dart';
import 'package:salonman/core/constants/color_utils.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/routes/app_routes.dart';

import '../../core/widgets/component.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
     Navigator.pushReplacementNamed(context, RouteName.introScreen);
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return commonScaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: colorBg,
        child: Column(
          spacing: 8,
          mainAxisAlignment:.center,
          crossAxisAlignment: .center,
          children: [
            commonAssetImage(icLogo,width: 80,height: 80),
            commonText(text: "Samrat",fontWeight: .bold,fontSize: 28,color: Colors.white)

          ],
        ),
      )

    );
  }
}
