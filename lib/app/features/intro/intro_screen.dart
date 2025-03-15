import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IntroductionScreen(
        pages: [
          
        ],
      ),
    );
  }
}