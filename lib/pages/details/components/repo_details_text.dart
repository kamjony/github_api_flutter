import 'package:flutter/material.dart';

class RepoDetailsText extends StatelessWidget {
  final String text;

  const RepoDetailsText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.justify,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic));
  }
}
