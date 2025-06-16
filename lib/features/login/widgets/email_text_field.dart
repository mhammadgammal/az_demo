import 'package:az_demo/core/widgets/animated_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
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
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField>
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
    return AnimatedTextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      inputType: TextInputType.emailAddress,
      onSubmit: (_) => widget.onSubmitted(),
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
