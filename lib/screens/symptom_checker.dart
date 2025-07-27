import 'package:flutter/material.dart';
import '../services/gemma_service.dart';

class SymptomChecker extends StatefulWidget {
  const SymptomChecker({super.key});

  @override
  State<SymptomChecker> createState() => _SymptomCheckerState();
}

class _SymptomCheckerState extends State<SymptomChecker> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  void analyze() async {
    setState(() => result = 'Analyzing...');
    final response = await GemmaService.askGemma(_controller.text);
    setState(() => result = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Symptom Checker')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Write down the symptoms (e.g. dizziness)',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: analyze,
              icon: const Icon(Icons.search),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Analyze', style: TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
            Text(result, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
