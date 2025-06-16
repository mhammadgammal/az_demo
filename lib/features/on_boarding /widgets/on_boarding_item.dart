import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        Text(title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(subtitle, textAlign: TextAlign.center),
        ),
      ],
    );
  }
}
