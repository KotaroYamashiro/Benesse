import 'package:flutter/material.dart';
import 'dart:async';
import 'package:benesse_online/screen/status.dart';

// minutes
const BreakTime = 1;
const StudyTime = 1;
const AdditionalTime = 1;

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

  Color _getColor() {
    if (_status == StatusType.offline) {
      return Colors.grey.shade300;
    } else if (_status == StatusType.breaktime) {
      return Colors.blue;
    } else if (_status == StatusType.studying) {
      return Colors.yellow;
    } else {
      throw Exception("Invalid status type");
    }
  }

  void _onPressRequest() {
    // update _initTime -> _initTime + addditionalTime
    setState(() {
      _initTime = _initTime.add(const Duration(minutes: AdditionalTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    var pomodoro = Container(
        color: _getColor(),
        height: 250,
        // width: 310,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            statusText(_status),
            Center(
              child: Text(
                displayTime(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ));
    var timerWidget = Container(
      color: Colors.pinkAccent,
      height: 250,
      width: double.infinity,
      child: Center(
        child: pomodoro,
      ),
    );
    var request = Container(
      height: 100,
      child: ElevatedButton(
          onPressed: _onPressRequest,
          child: const Center(
            child: Text(
              "延長リクエスト",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          )),
    );
    var requestWidget = Container(
      color: Colors.purpleAccent.shade100,
      height: 50,
      width: double.infinity,
      child: const Center(
        child: Text(
          "延長リクエスト",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Column(
      children: <Widget>[
        pomodoro,
        request,
      ],
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}
