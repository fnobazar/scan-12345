import 'package:flutter/material.dart';
import '../services/google_auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  final _auth = GoogleAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(width: 90, height: 90, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: Color(0xFFA0C4FF))), child: Icon(Icons.search, size: 45, color: Color(0xFF7BA7FF))),
            SizedBox(height: 20),
            Text('Welcome to Sca-N', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            Text('Scan, Search & Understand Anything', style: TextStyle(color: Colors.grey)),
            Spacer(),
            SizedBox(width: double.infinity, child: ElevatedButton.icon(icon: Icon(Icons.g_mobiledata, size: 28), label: Text('Continue with Google'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), padding: EdgeInsets.symmetric(vertical: 14)), onPressed: () async {
              final cred = await _auth.signInWithGoogle();
              if (cred != null && context.mounted) Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            })),
            SizedBox(height: 12),
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen())), style: OutlinedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), padding: EdgeInsets.symmetric(vertical: 14)), child: Text('Continue as Guest'))),
            SizedBox(height: 12),
            Text('We only access name, email, location and Drive file for backup. You can disconnect anytime.', style: TextStyle(fontSize: 11, color: Colors.grey), textAlign: TextAlign.center),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
