import 'package:az_demo/core/assets/app_images.dart';
import 'package:az_demo/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer;

import 'widgets/email_text_field.dart';
import 'widgets/password_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'), centerTitle: true),
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login successful!')));
            // Navigate to the next screen or perform any action on success
          }
        },
        builder: (context, state) {
          final cubit = LoginCubit.get(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: Image.asset(AppImages.logo),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome again to AZ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Please login to continue',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: 30),
                    EmailTextField(
                      cubit.emailController,
                      cubit.emailFocusNode,
                      onSubmitted: () {
                        FocusScope.of(
                          context,
                        ).requestFocus(cubit.passwordFocusNode);
                      },
                    ),
                    SizedBox(height: 20),
                    PasswordTextField(
                      cubit.passwordController,
                      cubit.passwordFocusNode,
                      onSubmitted: () {
                        cubit.login();
                      },
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (cubit.formKey.currentState!.validate()) {
                            cubit.login();
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
