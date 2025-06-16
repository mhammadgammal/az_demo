import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart'
    show FocusNode, FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool isPasswordVisible = false;

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  void login() async {
    emit(LoginLoadingState());
    Future.delayed(Duration(seconds: 2), () {
      emit(LoginSuccessState());
    });
  }

  void switchPasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginPasswordVisibilityChanged());
  }
}
