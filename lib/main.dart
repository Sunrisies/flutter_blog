import 'package:flutter/material.dart';

import 'counter/counter_page.dart';
import 'guess/guess_page.dart';
import 'tabbar/tabbar_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: '计算器'),
      // home:const GuessPage(title:'猜数字')
      home: BottomNavBar(),
    );


  }
}


