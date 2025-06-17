import 'package:az_demo/core/assets/app_images.dart';
import 'package:az_demo/core/router/app_navigator.dart';
import 'package:az_demo/core/router/route_keys.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          onEnd: () {
            AppNavigator.replaceWith(context, RouteKeys.onBoarding);
          },
          opacity: _opacity,
          duration: const Duration(seconds: 2),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Center(child: Image.asset(AppImages.logo)),
          ),
        ),
      ),
    );
  }
}
