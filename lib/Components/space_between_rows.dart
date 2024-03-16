import 'package:flutter/material.dart';

class SpaceBetweenRows extends StatelessWidget {
  late final double height;

  // CONSTRUCTS
  SpaceBetweenRows({super.key}) {
    height = 40;
  }

  SpaceBetweenRows.half({super.key}) {
    height = 20;
  }

  SpaceBetweenRows.quarter({super.key}) {
    height = 10;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
