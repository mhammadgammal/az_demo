import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<bool>> {
  HomeCubit(int cardCount) : super(List.filled(cardCount, false));

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
}
