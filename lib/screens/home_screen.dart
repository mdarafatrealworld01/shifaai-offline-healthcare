import 'package:flutter/material.dart';
import 'medicine_identifier.dart';
import 'symptom_checker.dart';
import 'mental_support.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShifaAI - Your Offline Health Assistant'),
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton(
              context,
              icon: Icons.medication_outlined,
              text: 'Identify Medicine',
              screen: const MedicineIdentifier(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.health_and_safety,
              text: 'Check Symptoms',
              screen: const SymptomChecker(),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              icon: Icons.self_improvement_outlined,
              text: 'Mental Help',
              screen: const MentalSupport(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required IconData icon, required String text, required Widget screen}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24),
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(text, style: const TextStyle(fontSize: 18)),
        ),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => screen)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
