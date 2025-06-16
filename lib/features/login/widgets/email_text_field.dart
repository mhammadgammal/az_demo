import 'package:az_demo/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function() onSubmitted;

  const EmailTextField(
    this.controller,
    this.focusNode, {
    super.key,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      focusNode: focusNode,
      inputType: TextInputType.emailAddress,
      onSubmit: (_) => onSubmitted(),
      inputAction: TextInputAction.next,
      fieldLabel: 'Email',
      icon: Icon(Icons.email_outlined),
      validate: _emailValidator,
    );
  }

  String? _emailValidator(String? email) =>
      email == null || email.isEmpty
          ? 'Email is required'
          : !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)
          ? 'Please enter a valid email address'
          : null;
}
