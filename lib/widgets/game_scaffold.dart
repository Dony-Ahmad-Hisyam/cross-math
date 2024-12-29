import 'package:flutter/material.dart';

class GameScaffold extends StatelessWidget {
  final Widget? body;
  final String? title;
  const GameScaffold({
    Key? key,
    this.body,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfff4dc),
      appBar: AppBar(
        title: Text(title ?? "Number Grid"),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.001),
          child: body,
        ),
      ),
    );
  }
}
