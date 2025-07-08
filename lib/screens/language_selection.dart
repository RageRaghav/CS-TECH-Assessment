
import 'package:cs_tech_assessment/screens/signup.dart';
import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {

  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'language': 'English', 'subtitle': 'Hi'},
    {'language': 'Hindi', 'subtitle': 'नमस्ते'},
    {'language': 'Bengali', 'subtitle': 'হ্যালো'},
    {'language': 'Kannada', 'subtitle': 'ನಮಸ್ಕಾರ'},
    {'language': 'Punjabi', 'subtitle': 'ਸਤ ਸ੍ਰੀ ਅਕਾਲ'},
    {'language': 'Tamil', 'subtitle': 'வணக்கம்'},
    {'language': 'Telugu', 'subtitle': 'హలో'},
    {'language': 'French', 'subtitle': 'Bonjour'},
    {'language': 'Spanish', 'subtitle': 'Hola'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Choose Your Language',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    return RadioListTile(
                      title: Text(lang['language']!),
                      subtitle: Text(lang['subtitle']!),
                      value: lang['language']!,
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value!;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SignupScreen.routeName);
                  },
                  child: const Text(
                    'Select',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
