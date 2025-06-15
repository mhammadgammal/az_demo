import 'package:az_demo/core/router/app_router.dart';
import 'package:az_demo/core/router/route_keys.dart';
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
      routes: routes,
      initialRoute: RouteKeys.splash,
    );
  }
}
