import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:latihanproyek/constant/constant.dart';
import 'package:latihanproyek/views/bmidatascreen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key,required this.bmi}) : super(key: key);
  final double bmi;

  determineBmiCategory(double bmiValue){
    String category ="";
    if (bmiValue <16.0){
      category = underweightSevere;
    } else if (bmiValue <17){
      category = underweightModerate;
    } else if (bmiValue <18.5){
      category = underweightMild;
    } else if (bmiValue <25){
      category = normal;
    } else if (bmiValue <30){
      category = overweight;
    } else if (bmiValue <35){
      category = obeseI;
    } else if (bmiValue <40){
      category = obeseII;
    } else if (bmiValue >40){
      category = obeseIII;
    }return category;
  }

  determineBmiSolution (double bmiScore){
    String category2 ="";
      if(bmiScore <18){
        category2 = eatmore;
      }
      else if(bmiScore <25){
        category2 = normal2;
      }
      else if(bmiScore >25){
        category2 = obese;
      }
      return category2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hitung Ulang'),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            child: Center(
              child: Text('Hasil Perhitungan',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: BmiCard(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(determineBmiCategory(bmi),
                  style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                  Text("${bmi.toStringAsFixed(1)}",
                  style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
                  Text(determineBmiSolution(bmi),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),),
              ]),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop(
              MaterialPageRoute(builder: ((ontext) {
                return BMIDataScreen();
              })),
            );
          },
          child: Container(
            height: 80,
            color: Color(0xFFec3c66),
            child: Center(
                child: Text(
              'Hitung Ulang',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )),
          ),
        )
      ]),
    );
  }
}
