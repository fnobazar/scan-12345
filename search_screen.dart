import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Search', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Find anything, ask anything', style: TextStyle(color: Colors.grey, fontSize: 12)),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(hintText: 'Search anything or ask a question...', prefixIcon: Icon(Icons.search), filled: true, fillColor: Color(0xFFF1F2F4), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))),
            SizedBox(height: 12),
            Text('Recent Searches', style: TextStyle(fontWeight: FontWeight.bold)),
            ListTile(leading: Icon(Icons.access_time), title: Text('Darjeeling hill history')),
            ListTile(leading: Icon(Icons.access_time), title: Text('iPhone 15 pro price')),
          ],
        ),
      ),
    );
  }
}
