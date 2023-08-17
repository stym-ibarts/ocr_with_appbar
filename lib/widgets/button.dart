import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String buttonText;
  final VoidCallback? onPressed;
  final FontWeight? fontWeight;

  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.buttonText,
    required this.onPressed,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    var bold = fontWeight;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size(330, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(buttonText,
          style: TextStyle(fontSize: 18.0, color: textColor, fontWeight: bold)),
    );
  }
}
