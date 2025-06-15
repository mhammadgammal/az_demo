import 'package:az_demo/core/router/route_keys.dart';
import 'package:flutter/material.dart'
    show Center, Scaffold, Text, WidgetBuilder;

final routes = <String, WidgetBuilder>{
  RouteKeys.splash: (context) => _screensPlaceholder(RouteKeys.splash),
  RouteKeys.onBoarding: (context) => _screensPlaceholder(RouteKeys.onBoarding),
  RouteKeys.login: (context) => _screensPlaceholder(RouteKeys.login),
  RouteKeys.home: (context) => _screensPlaceholder(RouteKeys.home),
};

_screensPlaceholder(String screenName) {
  return Scaffold(body: Center(child: Text('$screenName Screen')));
}
