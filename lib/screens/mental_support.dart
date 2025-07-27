import 'package:flutter/material.dart';
import '../services/gemma_service.dart';

class MentalSupport extends StatefulWidget {
  const MentalSupport({super.key});

  @override
  State<MentalSupport> createState() => _MentalSupportState();
}

class _MentalSupportState extends State<MentalSupport> {
  final TextEditingController _controller = TextEditingController();
  String result = '';

  void getHelp() async {
    setState(() => result = "Responding...");
    final prompt = "A person said: \"${_controller.text}\"Give peaceful and guiding answers in Islamic and scientific language.";
    final response = await GemmaService.askGemma(prompt);
    setState(() => result = response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mental Support')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Write your feelings',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: getHelp,
              icon: const Icon(Icons.volunteer_activism),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Get Help', style: TextStyle(fontSize: 18)),
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
