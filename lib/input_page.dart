import 'package:bmi/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card_property.dart';
import 'constants.dart';
import 'results_page.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int selectedGender = -1;
  int _heightInCm = 150;
  int _weightInKg = 60;
  int _age = 25;

  void onGenderTap(int gender) {
    setState(() {
      selectedGender = gender;
    });

    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        selectedGender = -1;
      });
    });
  }

  // Function to increment or decrement the weight
  void _updateWeight(int change) {
    setState(() {
      _weightInKg += change;
      if (_weightInKg < 30) {
        _weightInKg = 30; // Minimum weight limit
      } else if (_weightInKg > 200) {
        _weightInKg = 200; // Maximum weight limit
      }
    });
  }

  // Function to increment or decrement the age
  void _updateAge(int change) {
    setState(() {
      _age += change;
      if (_age < 1) {
        _age = 1; // Minimum age limit
      } else if (_age > 100) {
        _age = 100; // Maximum age limit
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 0; // 0 for Male
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == 0
                          ? bottomContainerColor // If Male is selected, highlight the card
                          : activeContainerColor, // Otherwise, keep it default
                      cardChild: CardProperty(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 1; // 1 for Female
                      });
                    },
                    child: ReusableCard(
                      colour: selectedGender == 1
                          ? bottomContainerColor // If Female is selected, highlight the card
                          : activeContainerColor, // Otherwise, keep it default
                      cardChild: CardProperty(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          '${_heightInCm.toStringAsFixed(0)} cm',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: bottomContainerColor,
                            inactiveTrackColor: Colors.grey,
                            trackHeight: 4,
                            thumbColor: bottomContainerColor,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 12),
                            overlayColor: bottomContainerColor.withOpacity(0.2),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 20),
                          ),
                          child: Slider(
                            value: _heightInCm.toDouble(),
                            min: 100,
                            max: 250,
                            divisions: 150,
                            onChanged: (newValue) {
                              setState(() {
                                _heightInCm = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: activeContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF8D8E98),
                          ),
                        ),
                        Text(
                          '$_weightInKg kg',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => _updateWeight(-1),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor: bottomContainerColor,
                              ),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => _updateWeight(1),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor: bottomContainerColor,
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ReusableCard(
                          colour: activeContainerColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'AGE',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Color(0xFF8D8E98),
                                ),
                              ),
                              Text(
                                '$_age years',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => _updateAge(-1),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: bottomContainerColor,
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => _updateAge(1),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(10),
                                      backgroundColor: bottomContainerColor,
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: _heightInCm, weight: _weightInKg);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmiResult: calc.calculateBMI(),
                            resultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          )));
            },
            child: Container(
              height: 60.0,
              width: double.infinity,
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
