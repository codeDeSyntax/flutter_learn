import 'package:flut_apps/animations/custom_painter_example/bouncing_ball_animation.dart';
import 'package:flut_apps/animations/explicit_examples/list_animation.dart';
import 'package:flut_apps/animations/explicit_examples/loading_animation.dart';
import 'package:flut_apps/animations/explicit_examples/login_animation.dart';
import 'package:flut_apps/animations/implicit_examples/animated_color_pallete.dart';
import 'package:flut_apps/auth_with_firebase/authentication.dart';
import 'package:flut_apps/auth_with_firebase/home_on_success.dart';
import 'package:flut_apps/gradient_screens/grad1.dart';
import 'package:flut_apps/gradient_screens/grad2.dart';
import 'package:flut_apps/gradient_screens/grad3.dart';
import 'package:flutter/material.dart';

import 'e_grocery/core/routes/app_routes.dart';
import 'e_grocery/core/routes/on_generate_route.dart';
import 'e_grocery/core/themes/app_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Add this line
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eGrocery',
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      // onGenerateRoute: RouteGenerator.onGenerate,
      // initialRoute: AppRoutes.authScreen,
      home:
          AnimatedColorPalette(), // const BouncingBallAnimation(), // const Grad1(), // const Grad2(), // const Grad3(), // const Grad4(), // const Grad5(), // const Grad6(), // const Grad7(), // const Grad8(), // const Grad9(), // const AuthenticationScreen(), // const HomeOnSuccess(),
      // const AuthenticationScreen(), // const HomeOnSuccess(), // const TeamReachHomePage(), // const Grad1(), // const Grad2(), // const Grad3(), // const Grad4(), // const Grad5(), // const Grad6(), // const Grad7(), // const Grad8(), // const Grad9(
    );
  }

  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Team|Reach',
  //     theme: ThemeData(
  //       // primaryColor: const Color(0xFF2979FF),
  //       // scaffoldBackgroundColor: Colors.white,
  //       fontFamily: 'Georgia',
  //       useMaterial3: true,
  //     ),
  //     home: const TeamReachHomePage(),
  //   );
  // }
}
