import 'package:flutter/material.dart';
import 'timer.dart';
import 'package:benesse_online/database/users.dart';
import 'package:benesse_online/database/study_records.dart';

class Benesse extends StatelessWidget {
  Benesse({super.key});
  var enter = <String>[];
  void _enter() {
    enter = <String>[];
    for (int i = 1; i < users.length; i++) {
      var latest_record_id = users[i]["latest_record_id"];

      if (studyRecords[latest_record_id]["quit_time"] == null) {
        enter.add(users[i]["name"]);
      }
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    _enter();
    return Scaffold(
      appBar: AppBar(
        title: const Text("オンライン自習室"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            color: Colors.orangeAccent,
                            height: 80,
                            width: 150,
                            child: const Center(
                                child: Text(
                              "部屋1",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            )))),
                    Expanded(
                        child: Container(
                            color: Colors.orangeAccent.shade100,
                            height: 80,
                            width: 150,
                            child: const Center(
                                child: Text(
                              "部屋2",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            )))),
                  ],
                ),
                PomodoroTimer(),
                // Container(
                //   color: Colors.blue,
                //   height: 250,
                //   width: double.infinity,
                //   child: Center(
                //     child: PomodoroTimer(),
                //   ),
                // ),
                // Container(
                //   color: Colors.purpleAccent.shade100,
                //   height: 50,
                //   width: double.infinity,
                //   child: const Center(
                //     child: Text(
                //       "延長リクエスト",
                //       style: TextStyle(
                //         fontSize: 25,
                //         fontWeight: FontWeight.w500,
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      for (final enter in enter)
                        Expanded(
                            child: Container(
                                height: 100,
                                color: Colors.lightGreen,
                                child: Text(
                                  enter,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.center,
                                ))),
                      // Container(
                      //     color: Colors.lightGreen,
                      //     child: Text(
                      //       "友達A",
                      //       style: TextStyle(
                      //         fontSize: 25,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     )),
                      // Container(
                      //     color: Colors.lightGreen,
                      //     child: Text(
                      //       "友達B",
                      //       style: TextStyle(
                      //         fontSize: 25,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     )),
                    ],
                  ),
                ),
                Container(
                  color: Colors.lightGreen.shade100,
                  height: 300,
                  width: double.infinity,
                  child: const Text(
                    "チャット欄...",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events), label: "ランキング"),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_compact),
              label: "自習室",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: "フレンド"),
          ],
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushNamed(context, 'ranking');
            } else if (index == 1) {
              Navigator.pushNamed(context, 'benesse');
            } else {
              Navigator.pushNamed(context, 'friends');
            }
          }),
    );
  }
}
