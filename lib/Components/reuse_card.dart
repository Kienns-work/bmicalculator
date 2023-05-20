import 'package:flutter/material.dart';

class ReuseCard extends StatelessWidget {
  const ReuseCard(
      {super.key, required this.color, this.cardChild, this.onPressed});
  final Widget? cardChild;
  final Color? color;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}
