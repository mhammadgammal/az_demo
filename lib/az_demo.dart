import 'package:az_demo/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AzDemo extends StatelessWidget {
  const AzDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AZ Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: Center(
          child: Card(
            child: Text(
              "Hello World",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ),
      ),
    );
  }
}
