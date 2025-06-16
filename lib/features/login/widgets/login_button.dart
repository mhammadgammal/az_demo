import 'package:az_demo/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: isLoading ? 0.0 : null,
          backgroundBuilder:
              isLoading
                  ? (context, set, child) =>
                      onButtonLoading(context, set, child)
                  : null,
        ),
        child: Text('Login'),
      ),
    );
  }

  onButtonLoading(BuildContext context, Set<WidgetState> set, Widget? child) =>
      Container(
        width: double.infinity,
        height: 30.0,
        padding: EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color:
                ElevatedButton.styleFrom().backgroundColor?.resolve(set) ??
                Colors.black,
            width: 1.0,
          ),
        ),
        child: SizedBox(
          width: 20.0,
          height: 20.0,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
}
