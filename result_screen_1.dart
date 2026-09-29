import 'package:flutter/material.dart';
import '../models/scan_result.dart';
import 'ask_more_screen.dart';

class ResultScreen extends StatelessWidget {
  final ScanResult result;
  const ResultScreen({required this.result, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(result.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 200, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xFFF1F2F4)), child: Center(child: Icon(Icons.image, size: 60))),
            SizedBox(height: 12),
            Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFFEEF5FF), borderRadius: BorderRadius.circular(12)), child: Text(result.summary)),
            SizedBox(height: 12),
            if (result.safety != null) Container(padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Color(0xFFFFF3E0), borderRadius: BorderRadius.circular(12)), child: Text('Safety: ${result.safety}')),
          ],
        ),
      ),
      bottomSheet: Container(padding: EdgeInsets.all(16), color: Colors.white, child: Row(children: [
        Expanded(child: OutlinedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AskMoreScreen(result: result))), child: Text('Ask More'))),
        SizedBox(width: 12),
        Expanded(child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black, foregroundColor: Colors.white), onPressed: () {}, child: Text('Save'))),
      ])),
    );
  }
}
