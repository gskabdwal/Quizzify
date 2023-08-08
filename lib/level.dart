import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Level extends StatefulWidget {
  const Level(this.showQuestionScreen, this.url, this.begin, {super.key});
  final void Function() begin;
  final void Function() showQuestionScreen;
  final void Function(String) url;

  @override
  State<Level> createState() => _LevelState();
}

class _LevelState extends State<Level> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select a level",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 20),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 33, 57),
              ),
              onPressed: () {
                widget.url("&difficulty=easy");
                setState(() {
                  widget.begin();
                });
              },
              child: const Text(
                "Easy",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 33, 57),
              ),
              onPressed: () {
                widget.url("&difficulty=medium");
                setState(() {
                  widget.begin();
                });
              },
              child: const Text(
                "Medium",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 3, 33, 57),
              ),
              onPressed: () {
                widget.url("&difficulty=hard");
                setState(() {
                  widget.begin();
                });
              },
              child: const Text(
                "Hard",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
