import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, this.switchScreen, {super.key});

  final void Function() startQuiz;
  final void Function() switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz_logo.jpg",
            width: 300,
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Quizzify",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Color.fromARGB(215, 142, 130, 193), fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 2, 35, 18),
              foregroundColor: const Color.fromARGB(214, 161, 152, 204),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
