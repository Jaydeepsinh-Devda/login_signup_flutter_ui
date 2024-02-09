import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  final Widget child;
  const CustomScrollWidget({required this.child, super.key});

 

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, viewPort) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: viewPort.maxHeight),
            child: child,
          ),
        );
      },
    );
  }
}