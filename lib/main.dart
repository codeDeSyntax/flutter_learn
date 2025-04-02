import 'package:flut_apps/practice_ui.dart';
import 'package:flutter/material.dart';

// import 'e_grocery/core/routes/app_routes.dart';
// import 'e_grocery/core/routes/on_generate_route.dart';
// import 'e_grocery/core/themes/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'eGrocery',
  //     theme: AppTheme.defaultTheme,
  //     onGenerateRoute: RouteGenerator.onGenerate,
  //     initialRoute: AppRoutes.onboarding,
  //   );
  // }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team|Reach',
      theme: ThemeData(
        // primaryColor: const Color(0xFF2979FF),
        // scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Georgia',
        useMaterial3: true,
      ),
      home: const TeamReachHomePage(),
    );
  }
}
