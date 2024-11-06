import 'package:flutter/material.dart';
import 'package:flutter_application_1/projeto.dart';

class FeedbackMessage extends StatelessWidget {
  final String message;
  final Color color;

  FeedbackMessage({required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(fontSize: 18, color: color),
      textAlign: TextAlign.center,
    );
  }
}