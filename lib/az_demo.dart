import 'package:flutter/material.dart';

class AzDemo extends StatelessWidget {
  const AzDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(body: Placeholder()),
    );
  }
}
