import 'package:flutter/material.dart';
import 'package:salonman/screen/auth/forgot_password.dart';
import 'package:salonman/screen/dashboard/dashboard_screen.dart';
import 'package:salonman/screen/intro/intro_screen.dart';

import '../../screen/auth/login_screen.dart';
import '../../screen/auth/signup_screen.dart';
import '../../screen/splash/splash_screen.dart';
import 'app_routes.dart';

class RouteGenerate {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return _buildPageRoute(const SplashScreen());
      case RouteName.introScreen:
        return _buildPageRoute( IntroScreen());
      case RouteName.loginScreen:
        return _buildPageRoute( LoginScreen());
      case RouteName.signUpScreen:
        return _buildPageRoute( SignupScreen());
      case RouteName.forgotPassword:
        return _buildPageRoute( ForgotPassword());
      case RouteName.dashboardScreen:
        return _buildPageRoute( DashboardScreen());
      default:
        return _buildPageRoute(const SplashScreen());
    }
  }

  static PageRouteBuilder _buildPageRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (_, _, _) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        // Animation starts from bottom (Offset(0, 1)) → center (Offset.zero)
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            // optional fade effect
            opacity: animation,
            child: child,
          ),
        );
      },
    );
  }
}
