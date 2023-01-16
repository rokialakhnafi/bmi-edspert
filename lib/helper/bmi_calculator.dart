import 'package:latihanproyek/constant/constant.dart';

class BmiCalcultor{
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;
BmiCalcultor({required this.height, required this.weight});
BmiCalcultor.fromBmiValue(this.bmi){
}
 double calculateBMI(){
    double heightIntMeter = height!/100;
    bmi = weight!/(heightIntMeter*heightIntMeter);
    return bmi!;
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
      bmiCategory = category2;
      return bmiCategory;
  }

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
    bmiDescription = category;
    }return bmiDescription;
  }


}

