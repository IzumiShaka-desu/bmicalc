
import 'package:flutter/material.dart';

import 'paage.dart';
Widget getTextWeightStats(double bmi){
    if(bmi>29.9)return Text('oh no you are obese',style:TextStyle(color:Colors.redAccent[700],fontWeight:FontWeight.bold));
    if(bmi>24.9)return Text(' no you are overweight',style:TextStyle(color:Colors.red[700],fontWeight:FontWeight.bold));
   if(bmi>18.9)return Text(' wow you weight is normal',style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.bold));
    if(bmi>16.4)return Text(' no you are underweight',style:TextStyle(color:Colors.orange,fontWeight:FontWeight.bold));
   else return Text(' no you are severely underweight',style:TextStyle(color:Colors.deepOrange,fontWeight:FontWeight.bold));
  }

double calculateBmi(double weight, double heightInMeter) =>
    weight / (heightInMeter * heightInMeter);
getTitle(Paages page) {
  switch (page) {
    case Paages.gender:
      return 'Select your Gender :';
    case Paages.body:
      return 'Your Heights and Weights :';
    case Paages.result:
      return 'Result :';
  }
}
