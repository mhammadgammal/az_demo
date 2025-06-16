import 'package:az_demo/core/assets/app_images.dart';
import 'package:flutter/material.dart'
    show BuildContext, Curves, PageController;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, Cubit;

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  static OnBoardingCubit get(BuildContext context) => BlocProvider.of(context);

  final PageController pageController = PageController();

  int currentPageIndex = 0;

  bool get lastPage => currentPageIndex == pages.length - 1;

  final List<(String, String, String)> pages = [
    (
      AppImages.purchaseOnline,
      "Purchase Online",
      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
    ),
    (
      AppImages.trackOrder,
      "Track Order",
      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
    ),
    (
      AppImages.getYourOrder,
      "Get Your Order",
      'Lorem ipsum dolor sit amet, consectetur adipiscing,sed do eiusmod tempor ut labore',
    ),
  ];

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void navToNextPage() {
    currentPageIndex++;
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    emit(OnBoardingPageChanged());
  }

  void navToPage(int index) {
    currentPageIndex = index;
    if (!lastPage) {
      pageController.animateToPage(
        currentPageIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    emit(OnBoardingPageChanged());
  }
}
