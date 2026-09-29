import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 100, height: 100, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFA0C4FF), width: 2)), child: Icon(Icons.search, size: 50, color: Color(0xFF7BA7FF))),
            SizedBox(height: 24),
            Text('Sca-N', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
            Text('Scan, Search & Understand Anything', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
