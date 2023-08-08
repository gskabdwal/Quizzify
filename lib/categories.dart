import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzify/data/categories.dart';

class Categories extends StatefulWidget {
  const Categories(this.showLevelScreen, this.url, {super.key});
  final void Function() showLevelScreen;
  final void Function(String) url;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select a category",
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(fontSize: 20),
                  color: const Color.fromARGB(255, 255, 255, 255)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final category in categories)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 3, 33, 57),
                        ),
                        onPressed: () {
                          widget.url("&category=${category["id"]}");
                          setState(() {
                            widget.showLevelScreen();
                          });
                        },
                        child: Text(category["name"] as String),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
