import 'package:flutter/material.dart';
import 'package:latihanproyek/constant/constant.dart';
import 'package:latihanproyek/views/bmiresultscreen.dart';

class BMIDataScreen extends StatefulWidget {
  const BMIDataScreen({super.key});

  @override
  State<BMIDataScreen> createState() => _BMIDataScreenState();
}

class _BMIDataScreenState extends State<BMIDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 19;
  String? gender;

  double calculateBMI(){
    double heightIntMeter = height/100;
    final bmi = weight/(heightIntMeter*heightIntMeter);
    return bmi;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        title: const Text('Kalkulator BMI'),
      ),
      body: Column(children: [
        Expanded(
            child: Row(
            children: [
            Expanded(
                child: GestureDetector(
                  onTap: (){
                    gender = "male";
                    setState(() {
                    });
                  },
                  child: BmiCard(
                    borderColor: 
                    (gender == "male") ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.male,
                      title: 'Male',
                              ),
                            ),
                )),
            Expanded(
                child: GestureDetector(
                  onTap: (){
                    gender = "female";
                    setState(() {
                    });
                  },
                  child: BmiCard(
                    borderColor: 
                    (gender == "female") ? Colors.white : primaryColor,
                    child: const GenderIconText(
                      icon: Icons.female, 
                      title: 'Female'
                      ),
                            ),
                )),
          ],
        )),
        Expanded(
            child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Height",
                  style: labelTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(
                        height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("$height",
                      style: numberStyle,), 
                      Text("Cm",
                      style: labelTextStyle,
                      )],
              ),
              Slider(
                value: height.toDouble(),
                min: 80,
                max: 200,
                thumbColor: Colors.white,
                activeColor: Colors.red,
                onChanged: (value) {
                  height = value.toInt();
                  setState((){});
                },
              )
            ],
            ),
          )),
        Expanded(child: Row(
          children: [
            Expanded(child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Weight",
                  style: labelTextStyle,
                  ),
                  Text("$weight",
                  style: numberStyle,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(onPressed: 
                      (){
                        weight +=1;
                        setState(() {
                          
                        });
                      },
                      elevation: 0,
                      child: const Icon(Icons.add,
                      color: Colors.white,
                      ),
                      shape: const CircleBorder(),
                      fillColor: const Color(0xff212747),
                      constraints: const BoxConstraints.tightFor(
                        height: 56,
                        width : 56,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RawMaterialButton(onPressed: 
                      (){
                        weight -=1;
                        setState(() {
                          
                        });
                      },
                      elevation: 0,
                      child: const Icon(Icons.remove,
                      color: Colors.white,
                      ),
                      shape: const CircleBorder(),
                      fillColor: const Color(0xff212747),
                      constraints: const BoxConstraints.tightFor(
                        height: 56,
                        width : 56,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ),
            Expanded(child: BmiCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Age",
                  style: labelTextStyle,
                  ),
                  Text("$age",
                  style: numberStyle,
                  ),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RawMaterialButton(onPressed: 
                      (){
                        age +=1;
                        setState(() {
                          
                        });
                      },
                      elevation: 0,
                      child: const Icon(Icons.add,
                      color: Colors.white,
                      ),
                      shape: const CircleBorder(),
                      fillColor: const Color(0xff212747),
                      constraints: const BoxConstraints.tightFor(
                        height: 56,
                        width : 56,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      RawMaterialButton(onPressed: 
                      (){
                        age -=1;
                        setState(() {
                          
                        });
                      },
                      elevation: 0,
                      child: Icon(Icons.remove,
                      color: Colors.white,
                      ),
                      shape: CircleBorder(),
                      fillColor: Color(0xff212747),
                      constraints: BoxConstraints.tightFor(
                        height: 56,
                        width : 56,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),),
          ],
        )),
        GestureDetector(
          onTap: () {
            //print(calculateBMI());
            Navigator.of(context).push(
              MaterialPageRoute(builder: ((ontext) {
                return ResultScreen(
                  bmi: calculateBMI(),
                );
              })),
            );
          },
          child: Container(
            height: 80,
            color: Color(0xFFec3c66),
            child: Center(child: Text('Hitung Nilai BMI',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),)),
          ),
        )
      ]),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = primaryColor,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFF272a4b), 
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: borderColor!),),
              margin: EdgeInsets.all(15),
              child: child);
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, 
        size: 80,
        color : Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
