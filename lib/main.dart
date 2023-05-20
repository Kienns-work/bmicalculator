import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 15,
          ),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
          overlayColor: Color(0x29FFBF00),
          activeTrackColor: Colors.amber,
          thumbColor: Color(0xffFFBF00),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: InputPage(),
      ),
      routes: {"/results_page": (context) => ResultsPage()},
    );
  }
}
