//import 'dart:ffi';
import 'package:flutter/widgets.dart';

import 'back.dart';
import 'nutrition.dart';
//import 'dart:async';
import 'dart:io';
//import 'dart:convert';
import 'package:flutter/material.dart';
// ignore: unused_import
//import 'package:flutter/accordion/accordion.dart';
// ignore: unused_import
import 'package:reactive_forms/reactive_forms.dart';
import 'package:table_calendar/table_calendar.dart';
import 'utils.dart';

class AllTimeInfo{
  late Map<String,DayInfo> foods;
  AllTimeInfo(this.foods);
  createNewDay(String time)
  {
    foods[time] = DayInfo(
    <Nutrition>[
      Nutrition("Завтрак",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Обед",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Ужин",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Полдник",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Перекус",0,0,0,0, List.empty(growable: true))],
    List.empty(growable: true));
  }
}
final Map<String,FoodInfo> foods = {
        "ChickenBreast(100g)": FoodInfo("ChickenBreast(100g)",23,4,0,135),
        "FriedEgg(1egg)": FoodInfo("FriedEgg(1egg)",6,7,0,89),
        "BoiledBuckwheat(100g)": FoodInfo("BoiledBuckwheat(100g)",3,4,19,120)
  };//тестовый список можешь использовать
String selectedDayTime = "${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day}";
//Все приемы пищи в неделю, пример обращения week1[0].breakfast.fats
final AllTimeInfo testTime = AllTimeInfo
({
  selectedDayTime:DayInfo(
    <Nutrition>[
      Nutrition("Завтрак",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Обед",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Ужин",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Полдник",0,0,0,0, List.empty(growable: true)), 
      Nutrition("Перекус",0,0,0,0, List.empty(growable: true))],
    List.empty(growable: true)),
}); 

void main()
{ 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp(
      title: 'Fitness app',
      home: const MyHomePage(title: 'fitness app home'),
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
    );
  }
}
/* 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Питание'),
      ),
      body: Accordion(children: [
        AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.shopping_cart, color: Colors.white),
              header: const Text('DataTable'),
              content: const MyDataTable(),
            ),
      ],),
    );
  }
}

class MyDataTable extends StatelessWidget //__
{
  const MyDataTable({super.key});

  @override
  Widget build(context) //__
  {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 1,
      showBottomBorder: false,
      columns: const [
        DataColumn(
            label: Text('ID'),
            numeric: true),
        DataColumn(
            label:
                Text('Description')),
        DataColumn(
            label: Text('Price'),
            numeric: true),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('1',
                textAlign: TextAlign.right)),
            DataCell(Text('Fancy Product')),
            DataCell(Text(r'$ 199.99',
                textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2',
                textAlign: TextAlign.right)),
            DataCell(
                Text('Another Product')),
            DataCell(Text(r'$ 79.00',
                textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3',
                textAlign: TextAlign.right)),
            DataCell(
                Text('Really Cool Stuff')),
            DataCell(Text(r'$ 9.99',
                 textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4',
                 textAlign: TextAlign.right)),
            DataCell(Text('Last Product goes here',
                )),
            DataCell(Text(r'$ 19.99',
                 textAlign: TextAlign.right))
          ],
        ),
      ],
    );
  }
} */

class MyHomePage extends StatefulWidget
{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int index = 0;

class _MyHomePageState extends State<MyHomePage> 
{

   @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F8F9),
        title: const Text('Главная'),
         titleTextStyle: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 24)
      ),
      body:
        ListView.separated(
        itemBuilder: (context, i)=> 
        ListTile(title:Text(testTime.foods[selectedDayTime]!.meals[i].name, 
        style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 16)),
   
        //subtitle: Text('Белки:${week1[0].meals[i].proteins} Жиры:${week1[0].meals[i].fats} Углеводы:${week1[0].meals[i].carbohydrates} Калории:${week1[0].meals[i].calories}'),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black87),
        onTap: (){
          index = i;
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MenuPerMeal(),));
        }
        ), 
       separatorBuilder: (context, index) => const Divider(color: Color.fromARGB(214, 204, 230, 7)),
        itemCount: 5),
        
        
        bottomNavigationBar: BottomNavigationBar(
         onTap: (int index){Navigator.of(context).push(MaterialPageRoute(builder: (context) => TableBasicsExample (),));},
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Питание',
            backgroundColor: Color.fromARGB(214, 204, 230, 7)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Тренировки',
             backgroundColor: Color.fromARGB(214, 204, 230, 7)
          ),
          BottomNavigationBarItem(
            icon: (Icon(Icons.access_alarm)),
            
            label: 'Календарь',
             backgroundColor: Color.fromARGB(214, 204, 230, 7),
             
          ),
        ],
        )
    );

    
  }
}


class MenuPerMeal extends StatefulWidget {
  const MenuPerMeal({super.key});

  @override
  State<MenuPerMeal> createState() => _MenuPerMealState();
}

class _MenuPerMealState extends State<MenuPerMeal> {

  
  late String userInput1;
  late String userInput2;
  late String userInput3;
  late String userInput4;
  late String userInput5;


  @override
  void initState() {
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F9),
      appBar: AppBar(
        title:Column(children: [Row(children: [Text("Белки: ${testTime.foods[selectedDayTime]!.meals[index].proteins}")]),
                                Row(children: [Text("Жиры: ${testTime.foods[selectedDayTime]!.meals[index].fats}", textAlign: TextAlign.center,)],),
                                Row(children: [Text("Углеводы: ${testTime.foods[selectedDayTime]!.meals[index].carbohydrates}", textAlign: TextAlign.center,)],),
                                Row(children: [Text("Калории: ${testTime.foods[selectedDayTime]!.meals[index].calories}", textAlign: TextAlign.center,)],)
        ]),
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
        toolbarHeight: 100,
        centerTitle: true,
        leading: IconButton(
          onPressed: (){ 
            Navigator.of(context).pop();
        } 
        , icon: const Icon(Icons.arrow_back_ios)) ,
      ),
      body: ListView.builder(
        itemCount: testTime.foods[selectedDayTime]!.meals[index].foods.length,
        itemBuilder: (BuildContext context, int i) {
          return Dismissible(
            key: Key(testTime.foods[selectedDayTime]!.meals[index].foods[i].name), 
            child: Card(
              color: Colors.white,
              child: ListTile(title: Text(testTime.foods[selectedDayTime]!.meals[index].foods[i].name),
              titleTextStyle: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w500))
            )
            );
        }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(214, 204, 230, 7) ,
         onPressed: (){
            showDialog(context: context, builder: (BuildContext context){
              return AlertDialog(
                title: Text("Добавить блюдо"),
                titleTextStyle:  const TextStyle(color: Colors.black87, fontSize: 15),
                content: Column( children: [
                        TextField(
                      decoration: InputDecoration(labelText: 'Блюдо'),
                      onChanged: (String value){
                        userInput1 = value;
                      },
                    ),
                        TextField(
                      decoration: InputDecoration(labelText: 'Белки'),
                      onChanged: (String value){
                        userInput2 = value;
                      },
                    ),
                        TextField(
                      decoration: InputDecoration(labelText: 'Жиры'),
                      onChanged: (String value){
                        userInput3 = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Углеводы'),
                      onChanged: (String value){
                        userInput4 = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Калории'),
                      onChanged: (String value){
                        userInput5 = value;
                      },
                    ),
                  ]
                ),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      setState((){
                        var newFood = FoodInfo(userInput1,int.parse(userInput2),int.parse(userInput3),int.parse(userInput4),int.parse(userInput5));
                        testTime.foods[selectedDayTime]!.meals[index].add(newFood.proteins,
                        newFood.fats,newFood.carbohydrates,newFood.calories);
                        testTime.foods[selectedDayTime]!.meals[index].foods.add(newFood);//foodPerDay.add(userInput);
                        
                      });

                      Navigator.of(context).pop();
                    }, 
                    child: Text("Добавить"))
                ],
              );
            });
          },
          child: const Icon(
            Icons.add_box,
            color: Colors.black87,
          )
          ),
    );
  }
}

class TableBasicsExample extends StatefulWidget {
  @override
  _TableBasicsExampleState createState() => _TableBasicsExampleState();
}

class _TableBasicsExampleState extends State<TableBasicsExample> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Календарь'),
      ),
      body: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarStyle: const CalendarStyle(
          selectedDecoration: const BoxDecoration(color: const Color.fromARGB(214, 204, 230, 7), shape: BoxShape.circle,),
          todayDecoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)
          ),
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              selectedDayTime = "${selectedDay.year}.${selectedDay.month}.${selectedDay.day}";
              if (!testTime.foods.containsKey(selectedDayTime)) testTime.createNewDay(selectedDayTime);
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}


