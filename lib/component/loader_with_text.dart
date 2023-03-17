import 'package:flutter/material.dart';

class LoaderWithText extends StatelessWidget {
  final String text;
  const LoaderWithText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(
          height: 10,
        ),
        Text(text,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white))
      ],
    );
  }
}
