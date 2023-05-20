import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({
    super.key,
    this.icon,
    this.label,
  });
  final IconData? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(icon, size: 100),
      SizedBox(height: 5),
      Text("$label", style: kLabelTextStyle),
    ]);
  }
}
