import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/gemma_service.dart';

class MedicineIdentifier extends StatefulWidget {
  const MedicineIdentifier({super.key});

  @override
  State<MedicineIdentifier> createState() => _MedicineIdentifierState();
}

class _MedicineIdentifierState extends State<MedicineIdentifier> {
  String result = '';

  Future<void> identifyMedicine() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() => result = "Analyzing...");
      final prompt = "What is the name of this medicine and what is it used for? Analyze the image (Demo taken: Napa";
      final response = await GemmaService.askGemma(prompt);
      setState(() => result = response);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Medicine Identifier')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: identifyMedicine,
              icon: const Icon(Icons.camera_alt),
              label: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14.0),
                child: Text('Take Photo', style: TextStyle(fontSize: 18)),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
