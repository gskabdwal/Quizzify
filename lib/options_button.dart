import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  const OptionsButton({super.key, required this.text, required this.onSelect});

  final String text;
  final void Function() onSelect;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: const Color.fromARGB(255, 40, 2, 97),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      onPressed: onSelect,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
