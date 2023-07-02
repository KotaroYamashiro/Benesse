import 'package:flutter/material.dart';
import 'dart:async';
import 'package:benesse_online/screen/status.dart';
import 'package:benesse_online/database/users.dart';
import 'package:benesse_online/database/study_records.dart';

const BreakTime = 1;
const StudyTime = 1;

class TimerCard extends StatefulWidget {
  final int userId;
  const TimerCard({super.key, required this.userId});

  @override
  State<TimerCard> createState() => _TimerCardState();
}

class _TimerCardState extends State<TimerCard> {
  DateTime _initTime = DateTime.now();
  DateTime _now = DateTime.now();
  StatusType _status = StatusType.studying;

  DateTime _getEnterTimeFromDatabase() {
    int record_id = users[widget.userId]["latest_record_id"];
    if (record_id == null) {
      throw Exception("record_id is null");
    }
    DateTime enter_time = studyRecords[record_id]["enter_time"];
    return enter_time;
  }

  @override
  void initState() {
    setState(() {
      _initTime = _getEnterTimeFromDatabase();
    });

    Timer.periodic(
      const Duration(seconds: 1),
      _setTimer,
    );
    super.initState();
  }

  void _setTimer(Timer timer) {
    DateTime now = DateTime.now();
    setState(() {
      _now = now;
    });
  }

  void _resetTimer() {
    DateTime now = DateTime.now();
    setState(() {
      _initTime = now;
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

  IconData statusIcon(StatusType status) {
    if (status == StatusType.studying) {
      return Icons.mode_edit;
    } else if (status == StatusType.breaktime) {
      return Icons.bedtime;
    } else {
      return Icons.restart_alt;
    }
  }

  Color statusBackColor(StatusType status) {
    if (status == StatusType.studying) {
      return Colors.yellow;
    } else if (status == StatusType.breaktime) {
      return Colors.blue;
    } else {
      return Colors.black;
    }
  }

  Color statusTextColor(StatusType status) {
    if (status == StatusType.studying) {
      return Colors.black;
    } else if (status == StatusType.breaktime) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  String getUsernameFromDatabase() {
    return users[widget.userId]["name"];
  }

  String statusText(StatusType status) {
    String resText = getUsernameFromDatabase() + ": ";
    if (status == StatusType.studying) {
      resText += "勉強中";
    } else if (status == StatusType.breaktime) {
      resText += "休憩中";
    } else {
      resText += "オフライン";
    }
    resText += " 残り" + _formatTime(_pastTime());
    return resText;
  }

  @override
  Widget build(BuildContext context) {
    return CardItem(
      icon: statusIcon(_status),
      color: statusBackColor(_status),
      textColor: statusTextColor(_status),
      text: statusText(_status),
    );
  }
}

class CardItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Color textColor;

  const CardItem({
    required this.icon,
    required this.color,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.0,
              color: textColor,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontFamily: 'SourceSans',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
