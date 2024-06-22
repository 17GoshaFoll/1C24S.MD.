//import 'dart:ffi';
//import 'back.dart';
import 'nutrition.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class DayInfo//информация о дне
{
  List<Workout> workouts;
  List<Nutrition> meals;
  DayInfo(this.meals, this.workouts);
  List totalDayNutrition()
  {
    var total = new List.empty();
    total.addAll([meals[0].proteins + meals[1].proteins + meals[2].proteins + meals[3].proteins + meals[4].proteins,
      meals[0].fats + meals[1].fats + meals[2].fats + meals[3].fats + meals[4].fats,
      meals[0].carbohydrates + meals[1].carbohydrates + meals[2].carbohydrates + meals[3].carbohydrates + meals[4].carbohydrates,
      meals[0].calories + meals[1].calories + meals[2].calories + meals[3].calories + meals[4].calories]);
    return total;
  }
}

enum TypeTreaning//тип тренировок
{
  cardio,
  chestArms,
  run
}

class Workout// упражнения
{
  String name;
  String info;
  TypeTreaning type;
  Workout(this.name, this.info, this.type);
}