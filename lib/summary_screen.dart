import 'package:flutter/material.dart';
import 'package:quizzify/summary_box.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen(this.summary, this.onShow, {super.key});
  final List<Map<String, Object>> summary;
  final Function() onShow;
  @override
  Widget build(BuildContext context) {
    final correctAnswers = summary.where((data) {
      return data["selected"] == data["answer"];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "You got $correctAnswers out of ${summary.length}!",
            style: GoogleFonts.lato(
                textStyle: const TextStyle(fontSize: 20),
                color: const Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...summary.map((data) {
                    return SummaryBox(data);
                  }),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: onShow,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh_rounded,
                  color: Color.fromARGB(255, 206, 168, 227),
                ),
                Text(
                  "Play Again",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 206, 168, 227),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
