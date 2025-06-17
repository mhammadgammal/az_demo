part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class AppLightTheme extends AppState {}

final class AppDarkTheme extends AppState {}
