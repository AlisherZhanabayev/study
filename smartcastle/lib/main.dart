import 'package:flutter/material.dart';

void main() {
  List<int> ages = [5, 7, 30, 41, 60, 72];
  int total = 0;
  print("Длина списка ages ${ages.length}");
  print("ages[0]: ${ages[0]}");

  ages.forEach((age) {
    if (age < 60) {
      print(age);
    } else {
      print("Старость не радость");
    }
  });

  var elderly = ages.where((age) => age >= 60);
  print(elderly);

  var old = ages.firstWhere((age) => age >= 60);
  print(old);

  var isEveryOld = ages.every((age) => age >= 60);
  print("Есть ли пожилые: $isEveryOld");

  var isAnyOld = ages.any((age) => age >= 60);
  print("Все ли пожилые: $isAnyOld");

  List<int> pupulationsMil = [100, 55, 1800, 2500];

  var isEvetyMegapolis = pupulationsMil.every((city) => city >= 1000);
  print("Все ли мегаполисы: $isEvetyMegapolis");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: Center(child: Text('Hello World!'))),
    );
  }
}
