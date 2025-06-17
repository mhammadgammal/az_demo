import 'package:az_demo/core/theme/app_colors.dart';
import 'package:az_demo/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

class AnimatedTextFormField extends StatefulWidget {
  const AnimatedTextFormField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.fieldLabel,
    required this.icon,
    required this.validate,
    this.isEnabled = true,
    this.obSecure = false,
    this.inputAction,
    this.suffixIcon,
    this.initialValue,
    this.maxLines,
    this.minLines,
    this.labelColor = AppColors.lightTextPrimary,
    this.iconColor = AppColors.lightTextPrimary,
    this.textFieldTextColor = AppColors.lightPrimary,
    this.onChanged,
    this.cursorColor = AppColors.lightPrimary,
    this.focusNode,
    this.onSubmit,
    this.maxLength,
  });

  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction? inputAction;
  final FocusNode? focusNode;
  final String? fieldLabel;
  final Icon? icon;
  final String? Function(String?)? validate;
  final Function(String)? onChanged;
  final bool obSecure;
  final IconButton? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final bool isEnabled;
  final String? initialValue;
  final Color labelColor;
  final Color iconColor;
  final Color textFieldTextColor;
  final Color cursorColor;
  final int? maxLength;
  final void Function(String?)? onSubmit;

  @override
  State<AnimatedTextFormField> createState() => _AnimatedTextFormFieldState();
}

class _AnimatedTextFormFieldState extends State<AnimatedTextFormField>
    with SingleTickerProviderStateMixin {
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_focusNodeListener);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            isFocused
                ? [
                  BoxShadow(
                    color: AppColors.lightAccent.withValues(alpha: 0.1),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ]
                : [],
      ),
      child: AppTextFormField(
        controller: widget.controller,
        inputType: widget.inputType,
        fieldLabel: widget.fieldLabel,
        suffixIcon: widget.suffixIcon,
        inputAction: widget.inputAction,
        focusNode: widget.focusNode,
        isEnabled: widget.isEnabled,
        obSecure: widget.obSecure,
        initialValue: widget.initialValue,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        labelColor: widget.labelColor,
        // iconColor: widget.iconColor,
        textFieldTextColor: widget.textFieldTextColor,
        onChanged: widget.onChanged,
        cursorColor: widget.cursorColor,
        onSubmit: widget.onSubmit,
        maxLength: widget.maxLength,
        icon: widget.icon,
        validate: widget.validate,
      ),
    );
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_focusNodeListener);
    super.dispose();
  }

  _focusNodeListener() {
    setState(() => isFocused = widget.focusNode?.hasFocus ?? false);
  }
}
