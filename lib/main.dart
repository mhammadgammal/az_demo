import 'package:az_demo/az_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AzObserver();
  runApp(const AzDemo());
}
