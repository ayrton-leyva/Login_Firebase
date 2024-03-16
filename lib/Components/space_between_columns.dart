import 'package:flutter/material.dart';

class SpaceBetweenColumns extends StatelessWidget {
  late final double height;

  // CONSTRUCTS
  SpaceBetweenColumns({super.key}) {
    height = 40;
  }

  SpaceBetweenColumns.half({super.key}) {
    height = 20;
  }

  SpaceBetweenColumns.quarter({super.key}) {
    height = 10;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
    );
  }
}
