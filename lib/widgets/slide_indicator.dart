import 'package:flutter/material.dart';

class SlideIndicator extends StatelessWidget {
  final bool isActive;
  SlideIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 12 : 5,
      height: 5,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white54,
          borderRadius: BorderRadius.circular(5.0)),
    );
  }
}
