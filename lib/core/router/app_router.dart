import 'package:az_demo/core/router/route_keys.dart';
import 'package:az_demo/features/home/presentation/cubit/home_cubit.dart';
import 'package:az_demo/features/home/presentation/home_screen.dart';
import 'package:az_demo/features/login/cubit/login_cubit.dart';
import 'package:az_demo/features/login/login_screen.dart';
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
  RouteKeys.login:
      (context) =>
          BlocProvider(create: (_) => LoginCubit(), child: const LoginScreen()),
  RouteKeys.home:
      (context) => BlocProvider(
        create: (context) => HomeCubit(3)..staggeredReveal(),
        child: HomeScreen(),
      ),
};

_screensPlaceholder(String screenName) {
  return Scaffold(body: Center(child: Text('$screenName Screen')));
}
