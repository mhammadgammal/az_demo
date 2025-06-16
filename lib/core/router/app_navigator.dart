import 'package:flutter/material.dart';

abstract class AppNavigator {
  static Future<dynamic> navigateTo(
    BuildContext context,
    String routeName, {
    Map<String, dynamic>? arguments,
  }) async => Navigator.pushNamed(context, routeName, arguments: arguments);
}
