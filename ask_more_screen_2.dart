import 'package:flutter/material.dart';
import '../models/scan_result.dart';
import '../services/ai_agent_service.dart';

class AskMoreScreen extends StatefulWidget {
  final ScanResult result;
  const AskMoreScreen({required this.result, super.key});
  @override
  State<AskMoreScreen> createState() => _AskMoreScreenState();
}

class _AskMoreScreenState extends State<AskMoreScreen> {
  final _ai = AiAgentService();
  final _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  void _ask(String q) async {
    setState(() { _messages.add({'role': 'user', 'text': q}); });
    _controller.clear();
    final stream = _ai.askMore(question: q, context: widget.result);
    String full = '';
    _messages.add({'role': 'ai', 'text': ''});
    await for (var chunk in stream) {
      full += chunk;
      setState(() => _messages.last['text'] = full);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ask More about ${widget.result.name}')),
      body: Column(
        children: [
          Expanded(child: ListView.builder(padding: EdgeInsets.all(16), itemCount: _messages.length, itemBuilder: (_, i) {
            final m = _messages[i];
            final isUser = m['role'] == 'user';
            return Align(alignment: isUser ? Alignment.centerRight : Alignment.centerLeft, child: Container(margin: EdgeInsets.symmetric(vertical: 4), padding: EdgeInsets.all(12), decoration: BoxDecoration(color: isUser ? Colors.black : Color(0xFFF1F2F4), borderRadius: BorderRadius.circular(16)), child: Text(m['text']!, style: TextStyle(color: isUser ? Colors.white : Colors.black))));
          })),
          Padding(padding: EdgeInsets.all(12), child: Row(children: [
            Expanded(child: TextField(controller: _controller, decoration: InputDecoration(hintText: 'Ask anything...', filled: true, fillColor: Color(0xFFF1F2F4), border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none)))),
            IconButton(onPressed: () => _ask(_controller.text), icon: Icon(Icons.send)),
          ])),
        ],
      ),
    );
  }
}
