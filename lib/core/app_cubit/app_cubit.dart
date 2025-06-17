import 'package:az_demo/core/cache/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDarkMode = false;

  changeTheme() async {
    if (state is AppDarkTheme) {
      isDarkMode = false;
      final instance = await CacheHelper.getInstance();
      instance.putBool('isDarkMode', isDarkMode);
      emit(AppLightTheme());
    } else {
      isDarkMode = true;
      final instance = await CacheHelper.getInstance();
      instance.putBool('isDarkMode', isDarkMode);
      emit(AppDarkTheme());
    }
  }

  getCurrentTheme() async {
    final instance = await CacheHelper.getInstance();
    isDarkMode = instance.getBool(key: 'isDarkMode') ?? false;
    emit(isDarkMode ? AppDarkTheme() : AppLightTheme());
  }
}
