//import 'dart:ffi';
//import 'back.dart';
//import 'nutrition.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class MealsPerDay//приемы пищи в день, показалось лучше простого списка
{
  Nutrition breakfast;
  Nutrition lucnh;
  Nutrition dinner;
  Nutrition afternoon;
  Nutrition snack;
  MealsPerDay(this.breakfast, this.lucnh, this.dinner, this.afternoon, this.snack);
  List totalDayNutrition()
  {
    var total = new List.empty();
    total.addAll([breakfast.proteins + lucnh.proteins + dinner.proteins + afternoon.proteins + snack.proteins,
    breakfast.fats + lucnh.fats + dinner.fats + afternoon.fats + snack.fats,
    breakfast.carbohydrates + lucnh.carbohydrates + dinner.carbohydrates + afternoon.carbohydrates + snack.carbohydrates,
    breakfast.calories + lucnh.calories + dinner.calories + afternoon.calories + snack.calories]);
    return total;
  }
}

class Nutrition
{
  String name;
  int proteins;
  int fats ;
  int carbohydrates ;
  int calories;//chadge double
  List<FoodInfo> foods;//список еды за прием пищи
  Nutrition(this.name, this.proteins, this.fats, this.carbohydrates, this.calories, this.foods);

  void add(int addProt, int addFats, int addCarbohydrates, int addCalories)
  {
    proteins += addProt;
    fats += addFats;
    carbohydrates += addCarbohydrates;
    calories += addCalories;

  }

  void addWithNameFood(String name, Map<String,FoodInfo> listFood)
  {
    if (listFood.containsKey(name)){
        var newFood = listFood[name];
          foods.add(newFood!);
        add(newFood.proteins, newFood.fats, newFood.carbohydrates, newFood.calories);
    }//добавление еды по ее названию
  }

  void addWithFoodInfo(FoodInfo newFood)
  {
    add(newFood.proteins, newFood.fats, newFood.carbohydrates, newFood.calories);
  }
}

class FoodInfo
{
  String name;
  int proteins;
  int fats ;
  int carbohydrates ;
  int calories;
  FoodInfo(this.name, this.proteins, this.fats, this.carbohydrates, this.calories);
  
  void convertFoodInfo(String userInput){
    name = userInput.split(" ")[0];
    proteins = int.parse(userInput.split(" ")[1]);
    fats = int.parse(userInput.split(" ")[2]);
    carbohydrates = int.parse(userInput.split(" ")[3]);
    calories = int.parse(userInput.split(" ")[4]);
  }
}//информация по еде