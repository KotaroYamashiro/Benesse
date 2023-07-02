import 'package:benesse_online/screen/benesse.dart';
import 'package:benesse_online/screen/ranking.dart';
import 'package:benesse_online/screen/friends.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'friends',
      title: '自習室アプリ',
      routes: {
        'benesse': (context) => Benesse(),
        'ranking': (context) => Ranking(),
        'friends': (context) => Friends(),
      },
    );
  }
}
