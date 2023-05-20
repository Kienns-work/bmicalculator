import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

import '../Components/bottom_button.dart';
import '../Components/reuse_card.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  String? r, b, i;
  ResultsPage() {}
  // ResultsPage(
  //     {super.key,
  //     String result = "Normal",
  //     String bmi = "1000",
  //     String interpresentation = "Unknown"}) {
  //   r = result;
  //   b = bmi;
  //   i = interpresentation;

  //   print(result);
  //   print(bmi);
  //   print(interpresentation);
  //   print("Hello");
  // }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    String? result = (args as Map<String, dynamic>?)?['result'] as String?;
    String? bmi = (args as Map<String, dynamic>?)?['bmi'] as String?;
    String? interpresentation =
        (args as Map<String, dynamic>?)?['interpresentation'] as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Your Result",
            style: kTextTitleStyle,
          ),
          Expanded(
            flex: 5,
            child: ReuseCard(
              color: kInActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result.toString(),
                    style: kTextResultStyle,
                  ),
                  Text(
                    bmi.toString(),
                    style: kBMIResultStyle,
                  ),
                  Text(
                    interpresentation.toString(),
                    style: kLabelTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            name: "Re-Calculate",
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
