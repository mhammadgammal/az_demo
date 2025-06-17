import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: SizedBox(),
      secondChild: Placeholder(),
      crossFadeState: CrossFadeState.showFirst,
      duration: Duration(milliseconds: 300),
    );
  }
}
