import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

final unescape = HtmlUnescape();

class SummaryBox extends StatelessWidget {
  const SummaryBox(this.summary, {super.key});
  final Map<String, Object> summary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor:
              summary["color"] as bool ? Colors.greenAccent : Colors.redAccent,
          child: Text(
            summary["questionIndex"] as String,
            style: const TextStyle(
              color: Color.fromARGB(255, 35, 34, 34),
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                unescape.convert(summary["question"] as String),
                style: const TextStyle(
                  color: Color.fromARGB(255, 198, 206, 206),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                unescape.convert(summary["answer"] as String),
                style: const TextStyle(
                  color: Color.fromARGB(255, 93, 222, 88),
                  fontSize: 14,
                ),
              ),
              Text(
                unescape.convert(summary["selected"] as String),
                style: const TextStyle(
                  color: Color.fromARGB(255, 149, 185, 199),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    );
  }
}
