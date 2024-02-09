import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String headlineText;
  final String subText;

  const HeadlineText({
    super.key,
    required this.headlineText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Healine Text
        Text(
          headlineText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 34,
          ),
        ),

        //Space in Between
        const SizedBox(height: 8),

        // Sub Text
        Text(
          subText,
          style: const TextStyle(
            color: Color(0xFF5a5c63),
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
