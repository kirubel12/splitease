import 'package:flutter/material.dart';
import 'package:splitease/shared/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplitEase',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SplitEase',
            style: TextStyle(color: AppColors.neutral950, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
