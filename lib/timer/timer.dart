import 'package:flutter/material.dart';
import 'dart:async';
import 'package:benesse_online/statas.dart';

// minutes
const BreakTime = 5;
const StudyTime = 2;

class PomodoroTimerState extends State<PomodoroTimer> {
  DateTime _initTime = DateTime.now();
  DateTime _now = DateTime.now();
  StatusType _status = StatusType.studying;

  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 1),
      _setTimer,
    );
    super.initState();
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
    DateTime baseTime;
    if (_status == StatusType.offline) {
      return 0;
    } else if (_status == StatusType.breaktime) {
      baseTime = _initTime.add(const Duration(minutes: BreakTime));
    } else if (_status == StatusType.studying) {
      baseTime = _initTime.add(const Duration(minutes: StudyTime));
    } else {
      throw Exception("Invalid status type");
    }

    int diffSecond = baseTime.difference(_now).inSeconds;

    // return minute25toSecond;
    return diffSecond;
  }

  void _updateStatus() {
    setState(() {
      _status = flipStatus(_status);
    });
  }

  String _formatTime(int diff) {
    // 例外処理
    if (diff > 25 * 60) {
      throw Exception("diff is over 25 minutes");
    }

    if (diff <= 0) {
      _resetTimer();
      _updateStatus();
      return "00:00";
    }

    int minute = diff ~/ 60;
    int second = diff % 60;
    return minute.toString().padLeft(2, "0") +
        ":" +
        second.toString().padLeft(2, "0");
  }

  String displayTime() {
    String time = _formatTime(_pastTime());
    String displayTime = "remaining time: $time!";
    return displayTime;
  }

  @override
  Widget build(BuildContext context) {
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
          statusText(_status),
          Text(
            displayTime(),
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
