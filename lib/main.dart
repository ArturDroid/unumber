import 'package:flutter/material.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'package:unumber/Pages/graph_page.dart';
import 'dart:developer';

import 'Pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SlideDrawer(
        offsetFromRight: 250,
        items: [
          MenuItem('История расчетов', onTap: () {log('Pressed History');}),
          MenuItem('Пакеты услуг', onTap: () {}),
          MenuItem('Как пользоваться', onTap: () {}),
          MenuItem('Авторы', onTap: () {}),
          MenuItem('Настройки', onTap: () {}),
        ],

          backgroundGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            colors: [
              Color(0xFF000046),
              Color(0xFF1CB5E0),
            ],
          ),
        child: const HomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
