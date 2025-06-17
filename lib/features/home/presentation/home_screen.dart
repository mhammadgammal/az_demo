import 'package:az_demo/core/app_cubit/app_cubit.dart';
import 'package:az_demo/core/assets/app_images.dart';
import 'package:az_demo/features/home/presentation/cubit/home_cubit.dart';
import 'package:az_demo/features/home/presentation/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        leading: IconButton(
          onPressed: () => AppCubit.get(context).changeTheme(),
          icon: Icon(
            AppCubit.get(context).isDarkMode ? Icons.nightlight : Icons.sunny,
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, List<bool>>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 16.0,
              right: 16.0,
              bottom: 8.0,
            ),
            child: Column(
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(AppImages.logo),
                  ),
                ),
                Center(
                  child: Text(
                    'Welcome to the Home Screen!',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder:
                        (context, index) => ServiceCard(
                          isVisible: state[index],
                          delay: Duration(milliseconds: index * 200),
                          child: Card(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Text(
                                'Card ${index + 1}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
