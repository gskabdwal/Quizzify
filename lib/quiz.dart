import 'package:flutter/material.dart';
import 'package:quizzify/categories.dart';
import 'package:quizzify/level.dart';
import 'package:quizzify/models/quiz_question.dart';
import 'package:quizzify/start_screen.dart';
import 'package:quizzify/question_screen.dart';
import 'package:http/http.dart' as http;
import 'package:quizzify/data/questions.dart';
import 'dart:convert' as convert;

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var url = "https://opentdb.com/api.php?amount=10";

  late Widget activeScreen;
  var screen = "startscreen";

  void switchScreen() {
    setState(() {
      screen = "category";
    });
  }

  void startAgain() {
    setState(() {
      screen = "startscreen";
    });
  }

  void category() {
    setState(() {
      screen = "level";
    });
  }

  void level() {
    setState(() {
      screen = "questionscreen";
    });
  }

  void uUrl(String str) {
    url += str;
  }

  void begin() async {
    var urlU = Uri.parse(url);
    var response = await http.get(urlU);
    if (response.statusCode == 200) {
      final resList = convert.jsonDecode(response.body)["results"];
      questions = [];
      for (final entry in resList) {
        questions.add(QuizQuestion('${entry["question"]}',
            ['${entry["correct_answer"]}', ...entry["incorrect_answers"]]));
      }
    }
    level();
  }

  @override
  Widget build(BuildContext context) {
    if (screen == "startscreen") {
      setState(() {
        activeScreen = StartScreen(switchScreen, startAgain);
      });
    } else if (screen == "questionscreen") {
      setState(() {
        activeScreen = QuestionScreen(startAgain);
      });
    } else if (screen == "category") {
      setState(() {
        activeScreen = Categories(category, uUrl);
      });
    } else if (screen == "level") {
      setState(() {
        activeScreen = Level(level, uUrl, begin);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 46, 4, 65),
                Color.fromARGB(255, 18, 4, 65),
                Color.fromARGB(255, 4, 39, 65),
                Color.fromARGB(255, 4, 65, 40),
                Color.fromARGB(255, 6, 103, 14),
                Color.fromARGB(255, 100, 38, 4)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
