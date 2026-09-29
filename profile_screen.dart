import 'package:flutter/material.dart';
import '../services/google_auth_service.dart';

class ProfileScreen extends StatelessWidget {
  final _auth = GoogleAuthService();
  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    return SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
      SizedBox(height: 8),
      Text(user?.displayName ?? 'Guest User', style: TextStyle(fontWeight: FontWeight.bold)),
      Text(user?.email ?? 'guest@sca-n.app', style: TextStyle(color: Colors.grey, fontSize: 12)),
      if (user != null) Chip(label: Text('Google Connected'), backgroundColor: Colors.green.shade50),
      Expanded(child: ListView(children: [
        ListTile(leading: Icon(Icons.cloud_outlined), title: Text('Cloud Sync'), trailing: Switch(value: true, onChanged: (_) {})),
        ListTile(leading: Icon(Icons.location_on_outlined), title: Text('Location'), trailing: Switch(value: true, onChanged: (_) {})),
        ListTile(leading: Icon(Icons.drive_folder_upload), title: Text('Drive Backup'), trailing: Switch(value: true, onChanged: (_) {})),
        ListTile(leading: Icon(Icons.logout), title: Text('Disconnect Google'), onTap: () => _auth.disconnect()),
      ])),
    ])));
  }
}
