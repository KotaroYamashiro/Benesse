import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTimerState extends State<PomodoroTimer> {
  DateTime _initTime = DateTime.now();
  DateTime _now = DateTime.now();

  void initState() {
    Timer.periodic(
      Duration(seconds: 1),
      _setTimer,
    );
    super.initState();
    _initTime = DateTime.now();
  }

  void _resetTimer() {
    DateTime now = DateTime.now();
    setState(() {
      _initTime = now;
    });
  }

  void _setTimer(Timer timer) {
    DateTime now = DateTime.now();
    setState(() {
      _now = now;
    });
  }

  int _pastTime() {
    var dateTime1 = DateTime(2021, 12, 12, 12, 0, 0);
    var dateTime2 = DateTime(2021, 12, 12, 12, 25, 0);

    int minute25toSecond = dateTime2.difference(dateTime1).inSeconds;

    int diffSecond = minute25toSecond - _now.difference(_initTime).inSeconds;

    // return minute25toSecond;
    return diffSecond;
  }

  String _formatTime(int diff) {
    // 例外処理
    if (diff < 0 || diff > 25 * 60) {
      return "00:00";
    }

    int minute = diff ~/ 60;
    int second = diff % 60;
    return minute.toString().padLeft(2, "0") +
        ":" +
        second.toString().padLeft(2, "0");
  }

  @override
  Widget build(BuildContext context) {
    String time = _formatTime(_pastTime());
    final String displayTime = "残り" + time + "!";
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(14.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "勉強中！",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}
