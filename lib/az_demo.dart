import 'package:az_demo/core/router/app_router.dart';
import 'package:az_demo/core/router/route_keys.dart';
import 'package:az_demo/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app_cubit/app_cubit.dart';

class AzDemo extends StatelessWidget {
  const AzDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getCurrentTheme(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'AZ Demo',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode:
                context.read<AppCubit>().isDarkMode
                    ? ThemeMode.dark
                    : ThemeMode.light,
            routes: routes,
            initialRoute: RouteKeys.onBoarding,
          );
        },
      ),
    );
  }
}
