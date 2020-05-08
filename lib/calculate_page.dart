import 'package:flutter/material.dart';
import 'constants.dart';

class CalculatePage extends StatelessWidget {
  CalculatePage(
      this.bmiResult, this.resultText, this.interpretation, this.colorResult);
  final String bmiResult;
  final String resultText;
  final String interpretation;
  final Color colorResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 52),
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              child: Text('Your Result', style: kCalcTextStyle),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            width: 320,
            padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
            margin: EdgeInsets.fromLTRB(10, 20, 10, 50),
            decoration: BoxDecoration(
              color: Color(0xFF251D37),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    resultText,
                    style: TextStyle(
                      color: colorResult,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Normal BMI range:',
                    style: TextStyle(
                      color: Color(0xFF8E8B98),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '18.5 - 25 kg/m2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                  child: Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'RECALCULATE',
                style: kbbTextStyle,
              ),
              margin: EdgeInsets.only(top: 10),
              height: kbbHeight,
              width: double.infinity,
              color: kbbColour,
            ),
          ),
        ],
      ),
    );
  }
}
