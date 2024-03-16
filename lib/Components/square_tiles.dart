import 'package:flutter/material.dart';

class SquareTiles extends StatelessWidget {
  final String imagePath;
  final MaterialColor materialColor;
  final Function()? onTap;

  const SquareTiles({
    super.key,
    required this.imagePath,
    required this.materialColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: materialColor[200]),
        height: 80,
        child: Image.asset(imagePath),
      ),
    );
  }
}
