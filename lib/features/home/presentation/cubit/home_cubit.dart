import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<bool>> {
  HomeCubit(int cardCount) : super(List.filled(cardCount, false));

  static HomeCubit get(context) => BlocProvider.of(context);

  void showCard(int index) {
    final newState = List<bool>.from(state);
    newState[index] = true;
    emit(newState);
  }

  void staggeredReveal() {
    for (int i = 0; i < state.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () => showCard(i));
    }
  }

  void addService() {
    final newState = List<bool>.from(state)..add(false);
    emit(newState);
    // Show the new card with animation
    Future.delayed(const Duration(milliseconds: 30), () {
      showCard(newState.length - 1);
    });
  }
}
