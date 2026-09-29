import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../services/ai_agent_service.dart';
import '../services/location_service.dart';
import '../services/drive_service.dart';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final _ai = AiAgentService();
  final _loc = LocationService();
  final _drive = DriveService();
  bool _loading = false;

  Future<void> _pickAndIdentify() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    setState(() => _loading = true);
    try {
      final pos = await _loc.getCurrentLocation();
      final locTag = pos != null ? await _loc.getLocationTag(pos) : null;
      final result = await _ai.identifyAnything(File(file.path), locationTag: locTag);
      await _drive.backupScan(File(file.path), '${result.name}_${DateTime.now().millisecondsSinceEpoch}.jpg');
      if (mounted) Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(result: result)));
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scan')),
      body: Stack(
        children: [
          Container(color: Colors.black12, child: Center(child: Icon(Icons.camera_alt, size: 80, color: Colors.white))),
          Positioned(bottom: 40, left: 0, right: 0, child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(onPressed: _pickAndIdentify, icon: Icon(Icons.photo_library, size: 30)),
            GestureDetector(onTap: _pickAndIdentify, child: Container(width: 80, height: 80, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white, border: Border.all(color: Colors.black, width: 3)))),
            Icon(Icons.flash_off),
          ])),
          if (_loading) Container(color: Colors.white.withOpacity(0.9), child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [CircularProgressIndicator(), SizedBox(height: 12), Text('Detecting object'), Text('Identifying'), Text('Gathering info...')]))),
        ],
      ),
    );
  }
}
