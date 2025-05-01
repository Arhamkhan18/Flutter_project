import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/session_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SessionModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Session Demo',
      home: HomeScreen(),
    );
  }
}
