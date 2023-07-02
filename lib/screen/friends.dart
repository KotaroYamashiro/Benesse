import 'package:flutter/material.dart';
import 'database/benesse.dart' as benesse;
import 'database/timer_2.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // usersリストとstudyRecordsリストを同期させる関数
  List<bool> syncUserData(List<Map<String, dynamic>> users,
      List<Map<String, dynamic>> studyRecords) {
    List<bool> is_online = [];
    for (var user in users) {
      var latestRecordId = user['latest_record_id'];
      var latestRecord = studyRecords.firstWhere(
        (record) => record['id'] == latestRecordId,
        orElse: () => <String, dynamic>{}, // 空のMapを返す
      );
      if (latestRecord != null && latestRecord['quit_time'] == null) {
        is_online.add(true);
      } else {
        is_online.add(false);
      }
    }
    return is_online;
  }

  @override
  Widget build(BuildContext context) {
    // usersリストとstudyRecordsリストを同期させる処理を実行
    //List<bool> is_online = syncUserData(users, studyRecords);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('友達一覧'),
          backgroundColor: Colors.pinkAccent[200],
          actions: <Widget>[
            IconButton(
              onPressed: () => debugPrint("Email tapped!"),
              icon: Icon(Icons.email),
            ),
          ],
        ),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
                width: 320.0,
                child: Divider(
                  color: Colors.teal.shade900,
                ),
              ),

              TimerCard(userId: 0),
              TimerCard(userId: 1),
              TimerCard(userId: 2),
              TimerCard(userId: 3),
              TimerCard(userId: 4),
              TimerCard(userId: 5),
              TimerCard(userId: 6),
              TimerCard(userId: 7),
              TimerCard(userId: 8),
              TimerCard(userId: 9),

              // CardItem(
              //   icon: Icons.mode_edit,
              //   color: Colors.yellow,
              //   text: '友達B：勉強中残り20:22',
              //   textColor: Colors.black,
              // ),
              // CardItem(
              //   icon: Icons.bedtime,
              //   color: Colors.blue,
              //   text: '友達A：休憩中残り5:26',
              //   textColor: Colors.white,
              // ),
              // CardItem(
              //   icon: Icons.restart_alt,
              //   color: Colors.black,
              //   text: '友達D：オフライン',
              //   textColor: Colors.white,
              // ),
              // CardItem(
              //   icon: Icons.bedtime,
              //   color: Colors.blue,
              //   text: '友達A：休憩中残り5:26',
              //   textColor: Colors.white,
              // ),
              // CardItem(
              //   icon: Icons.mode_edit,
              //   color: Colors.yellow,
              //   text: '友達B：勉強中残り20:22',
              //   textColor: Colors.black,
              // ),
              // CardItem(
              //   icon: Icons.bedtime,
              //   color: Colors.blue,
              //   text: '友達A：休憩中残り5:26',
              //   textColor: Colors.white,
              // ),
              // CardItem(
              //   icon: Icons.mode_edit,
              //   color: Colors.yellow,
              //   text: '友達B：勉強中残り20:22',
              //   textColor: Colors.black,
              // ),
              // CardItem(
              //   icon: Icons.bedtime,
              //   color: Colors.blue,
              //   text: '友達C：休憩中残り3:29',
              //   textColor: Colors.white,
              // ),
              // CardItem(
              //   icon: Icons.restart_alt,
              //   color: Colors.black,
              //   text: '友達D：オフライン',
              //   textColor: Colors.white,
              // ),
              // CardItem(
              //   icon: Icons.mode_edit,
              //   color: Colors.yellow,
              //   text: '友達E：勉強中残り3:26',
              //   textColor: Colors.black,
              // ),
              // CardItem(
              //   icon: Icons.bedtime,
              //   color: Colors.blue,
              //   text: '友達F：休憩中残り5:00',
              //   textColor: Colors.white,
              // ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightGreen,
          child: Icon(Icons.call_missed),
          onPressed: () => debugPrint("Hello!"),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events),
              label: "ランキング",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.view_compact),
              label: "自習室",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "フレンド",
            ),
          ],
          onTap: (int index) => debugPrint("Tapped item: $index"),
        ),
      ),
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
