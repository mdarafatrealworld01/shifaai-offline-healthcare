import 'dart:convert';
import 'package:http/http.dart' as http;

class GemmaService {
  // Localhost API endpoint where Gemma 3n is running via Ollama
  static const String apiUrl = "http://localhost:11434/api/generate";

  // Function to send a prompt to Gemma 3n and receive a response
  static Future<String> askGemma(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "model": "gemma:3n",       // Model name
          "prompt": prompt,          // User prompt
          "stream": false            // Non-streaming response
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] ?? "No response found";
      } else {
        return "Gemma API error: ${response.statusCode}";
      }
    } catch (e) {
      return "There was a problem accessing: $e (Gemma access failed)";
    }
  }
}
