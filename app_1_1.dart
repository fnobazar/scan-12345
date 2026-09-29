import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

class Sca-NApp extends StatelessWidget {
  const Sca-NApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sca-N',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black, background: Colors.white),
        fontFamily: 'Inter',
      ),
      home: const SplashScreen(),
    );
  }
}
