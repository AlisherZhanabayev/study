import 'package:flutter/material.dart';

void main() {
  // int count = 0;
  // while (count <= 10) {
  //   print("Счетчик: $count");
  //   count++;
  // }

  // int countDo = 10;
  // do {
  //   print("Счетчик: $countDo");
  //   countDo++;
  // } while (countDo < 10);

  // for (int counterFor = 0; counterFor < 10; counterFor++) {
  //   print("Счетчик: $counterFor");
  //   if (counterFor == 7) {
  //     print("Lucky number seven");
  //   } else {
  //     print("Bad luck");
  //   }
  // }

  // List<int> ages = [5, 7, 30, 41, 60, 72];
  // int total = 0;
  // for (var age in ages) {
  //   total = total + age;
  // }
  // print("Нам всего $total");

  // for (int i = 1; i <= 10; i++) {
  //   print('5 * $i = ${5 * i}');
  // }

  // int favorite = 5;
  // for (int i = 0; i <= 10; i++) {
  //   print("$favorite * $i = ${favorite * i}");
  // }

  // int favorite = 5;
  // int sum = 0;
  // int counter = 0;
  // for (; counter <= 10; counter++) {
  //   int multiply = favorite * counter;
  //   sum += multiply;
  //   print("$favorite * $counter = ${multiply}; sum = $sum");
  // }
  // print('avg=${sum ~/ counter}');

  // Map<String, int> prices = {"Хлеб": 290, "Молоко": 900, "Яйца": 690};
  // for (var item in prices.entries) {
  //   print("${item.key} - ${item.value}");
  // }

  List<int> ages = [5, 7, 30, 41, 60, 72];
  int total = 0;
  print("Длина списка ages ${ages.length}");
  print("ages[0]: ${ages[0]}");

  // for (var age in ages) {
  //   total = age = total;
  // }

  for (int i = 0; i < ages.length; i++) {
    if (i == 2) continue;
    if (i == 3) break;
    total = total + ages[i];
  }

  print('Нам всего $total лет');

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
