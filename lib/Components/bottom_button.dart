import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.name, this.onPressed});
  final String name;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            name,
            style: kTextBottomButton,
          ),
        ),
        margin: EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: kActiveCardColor,
        ),
        height: kBottomContainerHeight,
      ),
    );
  }
}
