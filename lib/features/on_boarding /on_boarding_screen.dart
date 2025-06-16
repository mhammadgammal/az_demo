import 'package:az_demo/features/on_boarding%20/cubit/on_boarding_cubit.dart';
import 'package:az_demo/features/on_boarding%20/widgets/on_boarding_fab.dart';
import 'package:az_demo/features/on_boarding%20/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        return Scaffold(
          // floatingActionButton: ,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
            builder: (context, state) {
              final cubit = OnBoardingCubit.get(context);
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  spacing: 30,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: cubit.pageController,
                        onPageChanged: cubit.navToPage,
                        reverse: false,
                        itemCount: cubit.pages.length,
                        itemBuilder:
                            (context, index) => OnBoardingItem(
                              image: cubit.pages[index].$1,
                              title: cubit.pages[index].$2,
                              subtitle: cubit.pages[index].$3,
                            ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: cubit.pageController,
                      count: cubit.pages.length,
                      onDotClicked: cubit.navToPage,
                    ),
                    OnBoardingFab(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
