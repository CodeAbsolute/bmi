import 'package:bmi_demo/constants/app_constants.dart';
import 'package:bmi_demo/widgets/left_bar.dart';
import 'package:bmi_demo/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
                color: accentHexColor,
                fontSize: 32,
                fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height (m)",
                        hintStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight (kg)",
                        hintStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);

                  setState(() {
                    _bmiResult = _w / (_h * _h);

                    if (_bmiResult > 25) {
                      _textResult = "You\'re over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have normal weight";
                    } else {
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: Container(
                  width: 160,
                  height: 60,
                  // padding: EdgeInsets.all(12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Color(0xFFFFD700), width: 4.0),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: const Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: const TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: accentHexColor),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              const LeftBar(
                barWidth: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(barWidth: 70),
              const SizedBox(
                height: 20,
              ),
              const LeftBar(
                barWidth: 40,
              ),
              const SizedBox(
                height: 20,
              ),
              const RightBar(barWidth: 70),
              const SizedBox(
                height: 50,
              ),
              const RightBar(barWidth: 70),
            ],
          ),
        ));
  }
}
