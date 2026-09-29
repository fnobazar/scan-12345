import 'package:flutter/material.dart';
import 'scan_screen.dart';
import 'search_screen.dart';
import 'history_screen.dart';
import 'saved_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  final _pages = [HomeTab(), ScanScreen(), SearchScreen(), HistoryScreen(), SavedScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.camera_alt_outlined), label: 'Scan'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
          NavigationDestination(icon: Icon(Icons.history), label: 'History'),
          NavigationDestination(icon: Icon(Icons.bookmark_border), label: 'Saved'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good morning', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            TextField(decoration: InputDecoration(hintText: 'Search anything or ask...', prefixIcon: Icon(Icons.search), filled: true, fillColor: Color(0xFFF1F2F4), border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none))),
            SizedBox(height: 20),
            Center(child: Column(children: [Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle), child: Icon(Icons.camera_alt, color: Colors.white, size: 40)), SizedBox(height: 8), Text('Tap to Scan', style: TextStyle(fontWeight: FontWeight.w600))])),
            SizedBox(height: 20),
            Text('Quick Actions', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(child: GridView.count(crossAxisCount: 3, childAspectRatio: 1.2, children: [
              Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.shopping_bag_outlined), Text('Product', style: TextStyle(fontSize: 12))])),
              Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.landscape_outlined), Text('Place', style: TextStyle(fontSize: 12))])),
              Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.local_florist_outlined), Text('Plant', style: TextStyle(fontSize: 12))])),
              Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.back_hand_outlined), Text('Palm', style: TextStyle(fontSize: 12))])),
              Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.qr_code), Text('QR', style: TextStyle(fontSize: 12))])),
              Card(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.barcode_reader), Text('Barcode', style: TextStyle(fontSize: 12))])),
            ])),
          ],
        ),
      ),
    );
  }
}
