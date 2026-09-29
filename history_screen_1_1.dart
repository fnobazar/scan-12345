import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('History', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ListTile(leading: CircleAvatar(child: Icon(Icons.landscape)), title: Text('Green Ridge Hill'), subtitle: Text('Place • 2:30 PM')),
      ListTile(leading: CircleAvatar(child: Icon(Icons.shopping_bag)), title: Text('Sony Headphones'), subtitle: Text('Product • 11:00 AM')),
    ])));
  }
}
