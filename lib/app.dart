import 'package:bank_ui_app/common/assets.dart';
import 'package:bank_ui_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class BankUIApp extends StatelessWidget {
  const BankUIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank UI App',
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark().copyWith(primary: coral),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
