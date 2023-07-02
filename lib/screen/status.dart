import 'package:flutter/material.dart';

enum StatusType { studying, breaktime, offline }

final defaultstyle = TextStyle(fontSize: 22, fontWeight: FontWeight.w500);

StatusType flipStatus(StatusType status) {
  switch (status) {
    case StatusType.studying:
      return StatusType.breaktime;
    case StatusType.breaktime:
      return StatusType.studying;
    case StatusType.offline:
      return StatusType.offline;
    default:
      // raise exception
      throw Exception('Invalid status type');
  }
}

Center statusText(StatusType status) {
  // maybe use icon?
  switch (status) {
    case StatusType.studying:
      return Center(child: Text('Studying', style: defaultstyle));
    case StatusType.breaktime:
      return Center(child: Text('Breaktime', style: defaultstyle));
    case StatusType.offline:
      return Center(child: Text('Offline', style: defaultstyle));
    default:
      // raise exception
      throw Exception('Invalid status type');
  }
}

Widget statusBudge(StatusType status) {
  // maybe use icon?
  switch (status) {
    case StatusType.studying:
      return Text('Studying', style: defaultstyle);
    case StatusType.breaktime:
      return Text('Breaktime', style: defaultstyle);
    case StatusType.offline:
      return Text('Offline', style: defaultstyle);
    default:
      // raise exception
      throw Exception('Invalid status type');
  }
}

class Status extends StatelessWidget {
  StatusType status;

  Status({required this.status});

  @override
  Widget build(BuildContext context) {
    return statusBudge(status);
  }
}
