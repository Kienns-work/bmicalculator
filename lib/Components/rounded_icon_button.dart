import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({super.key, this.icon, this.onPressed});
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      fillColor: Colors.amber,
      splashColor: Colors.red,
      onPressed: onPressed,
      child: Icon(
        icon,
        size: 30,
        weight: 500,
      ),
    );
  }
}
