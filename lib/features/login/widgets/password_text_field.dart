import 'package:az_demo/core/widgets/animated_text_form_field.dart';
import 'package:az_demo/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function() onSubmitted;

  const PasswordTextField(
    this.controller,
    this.focusNode, {
    super.key,
    required this.onSubmitted,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField>
    with SingleTickerProviderStateMixin {
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      setState(() => isFocused = widget.focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = LoginCubit.get(context);
        return AnimatedTextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          inputType: TextInputType.visiblePassword,
          fieldLabel: 'Password',
          icon: Icon(Icons.lock_outline),
          obSecure: cubit.isPasswordVisible ? false : true,
          suffixIcon: IconButton(
            icon: Icon(
              cubit.isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
            ),
            onPressed: () {
              cubit.switchPasswordVisibility();
            },
          ),
          validate: _passwordValidator,
        );
      },
    );
  }

  String? _passwordValidator(String? password) =>
      password == null || password.isEmpty
          ? 'Password is required'
          : password.length < 8
          ? 'Password must be at least 8 characters long'
          : null;
}
