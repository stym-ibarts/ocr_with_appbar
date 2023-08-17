import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonBackgroudColor;
  VoidCallback? onPressed;

  CustomButton({
    super.key,
    required this.text,
    required this.buttonBackgroudColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Handle submit button press
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonBackgroudColor,
        fixedSize: const Size(130, 55),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}
