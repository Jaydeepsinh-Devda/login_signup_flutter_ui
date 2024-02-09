import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BottomText extends StatelessWidget {
  const BottomText(
      {super.key,
      required this.darkText,
      required this.lightText,
      this.onCLick});

  final String darkText;
  final String lightText;
  final Function()? onCLick;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: darkText,
            style: const TextStyle(
              color: Color(0xFF5a5c63),
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 5)),
          TextSpan(
              text: lightText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 72, 255, 243),
              ),
              recognizer: TapGestureRecognizer()..onTap = onCLick)
        ],
      ),
    );
  }
}
