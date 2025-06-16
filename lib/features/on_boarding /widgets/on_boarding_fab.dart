import 'package:az_demo/core/theme/app_colors.dart';
import 'package:az_demo/features/on_boarding%20/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingFab extends StatelessWidget {
  const OnBoardingFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (ctx, state) {
        final cubit = OnBoardingCubit.get(ctx);
        return AnimatedCrossFade(
          firstChild: _nextPageFab(
            onPressed: () {
              cubit.navToNextPage();
            },
          ),
          secondChild: _getStartedFab(context, onPressed: () {}),
          crossFadeState:
              cubit.lastPage
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
          secondCurve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
        );
      },
    );
  }

  _nextPageFab({required VoidCallback onPressed}) => FloatingActionButton(
    onPressed: onPressed,
    child: Icon(Icons.arrow_forward_ios),
  );

  _getStartedFab(BuildContext context, {required VoidCallback onPressed}) =>
      Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? AppColors.lightAccent
                  : AppColors.darkAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            'Get Started',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
