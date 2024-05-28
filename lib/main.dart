import 'package:flutter/material.dart';
import 'package:languagetranslator/screens/language_translation.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:  LanguageTranslationPage(),
    );
  }
}