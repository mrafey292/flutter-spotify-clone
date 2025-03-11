import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Color? textColor; // New parameter for text color

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.textColor, // Initialize text color
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        foregroundColor: textColor ?? Colors.white, // Set text color
      ),
      child: Text(
        title,
        style: TextStyle(
            color: textColor ?? Colors.white), // Ensure text color is applied
      ),
    );
  }
}
