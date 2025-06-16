import 'package:az_demo/core/router/route_keys.dart';
import 'package:az_demo/features/on_boarding%20/cubit/on_boarding_cubit.dart';
import 'package:az_demo/features/on_boarding%20/on_boarding_screen.dart';
import 'package:flutter/material.dart'
    show Center, Scaffold, Text, WidgetBuilder;
import 'package:flutter_bloc/flutter_bloc.dart';

final routes = <String, WidgetBuilder>{
  RouteKeys.splash: (context) => _screensPlaceholder(RouteKeys.splash),
  RouteKeys.onBoarding:
      (context) => BlocProvider(
        create: (_) => OnBoardingCubit(),
        child: OnBoardingScreen(),
      ),
  RouteKeys.login: (context) => _screensPlaceholder(RouteKeys.login),
  RouteKeys.home: (context) => _screensPlaceholder(RouteKeys.home),
};

_screensPlaceholder(String screenName) {
  return Scaffold(body: Center(child: Text('$screenName Screen')));
}
