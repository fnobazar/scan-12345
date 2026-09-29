import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Padding(padding: EdgeInsets.all(16), child: Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Saved', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Text('34 items')]),
      Expanded(child: GridView.count(crossAxisCount: 2, children: [
        Card(child: Column(children: [Expanded(child: Icon(Icons.image, size: 50)), Padding(padding: EdgeInsets.all(8), child: Text('Green Ridge Hill'))])),
      ])),
    ])));
  }
}
