import 'package:flutter/material.dart';
import 'timer.dart';
import 'database/rooms.dart';
import 'database/study_records.dart';
import 'database/users.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
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
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
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
                Container(
                  color: Colors.pinkAccent,
                  height: 250,
                  width: double.infinity,
                  child: Center(
                    child: PomodoroTimer(),
                  ),
                ),
                Container(
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
                ),
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
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events), label: "ランキング"),
          BottomNavigationBarItem(icon: Icon(Icons.view_compact), label: "自習室"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "フレンド"),
        ],
      ),
    );
  }
}
