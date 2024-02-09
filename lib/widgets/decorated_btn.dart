import 'package:flutter/material.dart';

class DecoratedBtn extends StatelessWidget {
  const DecoratedBtn({
    super.key,
    required this.text,
    this.onClick,
  });

  final void Function()? onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 72, 255, 243),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(250, 70),
        ),
      ),
      onPressed: onClick,
      child: Text(
        text,
        style: const TextStyle(
            color: Color(0xFF201d34),
            fontWeight: FontWeight.w600,
            fontSize: 18),
      ),
    );
  }
}
