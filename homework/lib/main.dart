import 'package:flutter/material.dart';

void main() {
  // Меню
  Map<String, double> menu = {
    'Эспрессо': 800.0,
    'Латте': 1200.5,
    'Капучино': 1150.0,
  };

  String baristaName = 'John';
  String drink = 'Латте';
  String size = 'M';
  int cups = 3;
  bool loyaltyCard = true;
  String payment = 'qr';

  // Добавки
  List<String> supplements = ['карамель', 'миндальное молоко'];
  supplements.add('корица');
  supplements.remove('корица');

  // выводим меню
  print('=========== МЕНЮ ===========');
  menu.forEach((name, price) {
    print('$name — $price тг');
  });

  // where - где напитки дешевле 1200
  List<String> cheapDrinks = menu.keys
      .where((name) => (menu[name] ?? 0) < 1200)
      .toList();
  print('Недорогие напитки: ${cheapDrinks.join(', ')}');

  // for - нумерованный список добавок
  print('Ваши добавки:');
  for (int i = 0; i < supplements.length; i++) {
    print('${i + 1}. ${supplements[i]}');
  }

  // Проверяем, есть ли напиток в меню
  if (menu.containsKey(drink)) {
    double drinkPrice = menu[drink] ?? 0;
    double cupPrice = drinkPrice + sizeExtra(size) + supplements.length * 150;
    double sum = cupPrice * cups;
    int discount = getDiscount(loyaltyCard, sum);
    double total = sum - sum * discount / 100;

    // while — готовим чашки по одной
    int cup = 1;
    while (cup <= cups) {
      print('Готовим чашку $cup из $cups...');
      cup++;
    }

    print('''
=========== ЧЕК: Coffee Break ===========
Бариста: $baristaName
Напиток: $drink ($size)
Добавки: ${supplements.join(', ')} (${supplements.length} шт.)
${sweetCoffee(supplements)}
Цена за чашку: $cupPrice тг
Количество чашек: $cups
${checkCups(cups)}
Сумма: $sum тг
Скидка: $discount%
Итого: $total тг
Оплата: ${getPayment(payment)}
Бонусы: ${getBonuses(loyaltyCard, cups)}
=========================================
''');
  } else {
    print('Нет в меню');
  }

  runApp(const MainApp());
}

// Надбавка за размер
int sizeExtra(String size) {
  switch (size) {
    case 'M':
      return 200;
    case 'L':
      return 400;
    default:
      return 0;
  }
}

// Скидка
int getDiscount(bool loyaltyCard, double sum) {
  if (loyaltyCard) {
    return 10;
  } else if (sum >= 5000) {
    return 5;
  } else {
    return 0;
  }
}

// Способ оплаты
String getPayment(String payment) {
  switch (payment) {
    case 'card':
      return 'картой';
    case 'cash':
      return 'наличными';
    default:
      return 'по QR-коду';
  }
}

// Сладкий кофе, если есть карамель
String sweetCoffee(List<String> supplements) {
  if (supplements.contains('карамель')) {
    return 'Сладкий кофе';
  } else {
    return 'Обычный кофе';
  }
}

// бонусы — 50 за чашку, если есть карта
int getBonuses(bool loyaltyCard, int cups) {
  if (loyaltyCard) {
    return cups * 50;
  } else {
    return 0;
  }
}

// от 5 чашек — подарок
String checkCups(int cups) {
  if (cups >= 5) {
    return 'Подарок: печенье!';
  } else {
    return 'Возьмите 5 чашек, получите печенье';
  }
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
