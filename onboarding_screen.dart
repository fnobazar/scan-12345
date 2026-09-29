import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Spacer(),
            Icon(Icons.camera_alt_outlined, size: 120, color: Color(0xFF7BA7FF)),
            SizedBox(height: 24),
            Text('Scan anything around you', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            SizedBox(height: 12),
            Text('Point your camera at any product, plant, place or palm to understand it instantly', style: TextStyle(color: Colors.grey), textAlign: TextAlign.center),
            Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), padding: EdgeInsets.symmetric(vertical: 16)), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen())), child: Text('Get Started'))),
            TextButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())), child: Text('Skip', style: TextStyle(color: Colors.grey))),
          ],
        ),
      ),
    );
  }
}
