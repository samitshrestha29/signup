import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundcolor;
  final String? imagePath;
  const MyButtons({
    super.key,
    required this.onPressed,
    required this.text,
    required this.backgroundcolor,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        backgroundColor: backgroundcolor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (imagePath != null) ...[
            Image.asset(
              imagePath!,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8),
          ],
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
