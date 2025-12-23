import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:salonman/provider/onboarding_provider.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';
List<SingleChildWidget> providers = [
  ChangeNotifierProvider<OnboardingProvider>(create: (_) => OnboardingProvider()),

];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: providers,
      child: const MyApp()));
}

class MyApp extends StatelessWidget {


  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: RouteName.splashScreen,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerate.onGenerateRoute,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
    );
  }
}
