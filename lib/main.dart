import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("オンライン自習室"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey.shade500,
        ),
        body: Container(
          alignment: Alignment.topLeft,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[_online(), _request()],
          ),
        ));
  }

  Container _online() {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "休憩中",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            "残り○○分",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Container _request() {
    return Container(
      width: 350,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.blue.shade300,
          borderRadius: BorderRadius.circular(14.5)),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "時間延長する",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

void _debug() => debugPrint("Email Tapped!");
