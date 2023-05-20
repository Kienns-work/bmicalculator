import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';

import '../Components/bottom_button.dart';
import '../Components/icon_content.dart';
import '../Components/reuse_card.dart';

import '../Components/rounded_icon_button.dart';
import '../constants.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender = GenderType.male;
  double height = 150;
  int weight = 65;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReuseCard(
                  onPressed: () {
                    setState(() {
                      print("male...");
                      selectedGender = GenderType.male;
                    });
                  },
                  color: selectedGender == GenderType.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    label: "Male",
                    icon: Icons.male_outlined,
                  ),
                ),
              ),
              Expanded(
                child: ReuseCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = GenderType.female;
                    });
                  },
                  color: selectedGender == GenderType.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    label: "Female",
                    icon: Icons.female_outlined,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ReuseCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "HEIGHT",
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${height.round()}",
                      style: kTextNumber,
                    ),
                    Text(
                      "cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  value: height,
                  min: 120,
                  max: 230,
                  onChanged: (double value) {
                    setState(() {
                      height = value;
                    });
                  },
                ),
              ],
            ),
            color: kInActiveCardColor,
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: ReuseCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            weight.toString(),
                            style: kTextNumber,
                          ),
                          Text("KG")
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            icon: Icons.remove_outlined,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                            icon: Icons.add_rounded,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  color: kInActiveCardColor,
                ),
              ),
              Expanded(
                child: ReuseCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            age.toString(),
                            style: kTextNumber,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedIconButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            icon: Icons.remove_outlined,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundedIconButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            icon: Icons.add_rounded,
                          ),
                        ],
                      ),
                    ],
                  ),
                  color: kInActiveCardColor,
                ),
              ),
            ],
          ),
        ),
        BottomButton(
          name: "Calculate",
          onPressed: () {
            print("lần thứ n");
            CalculatorBrain calc =
                CalculatorBrain(height: height.toDouble(), weight: weight);

            Map<String, dynamic> dataMap = {
              "result": calc.getResult(),
              "bmi": calc.bmiCalculate(),
              "interpresentation": calc.getInterpresentation(),
            };

            Navigator.of(context)
                .pushNamed("/results_page", arguments: dataMap);
          },
        )
      ],
    );
  }
}
