import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('勉強時間ランキング（oo大学）'),
            bottom: TabBar(
              tabs: [
                Tab(text: '志望校'),
                Tab(text: '友達'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '志望校',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '65位',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '(100人中)',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '友達',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '3位',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  '(10人中)',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: generateDataTable(),
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '志望校',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '65位',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  '(100人中)',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '友達',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  '3位',
                                  style: TextStyle(
                                    fontSize: 30,
                                  ),
                                ),
                                Text(
                                  '(10人中)',
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      FittedBox(
                        child: generateDataTable(true),
                      ),
                    ],
                  ),

                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_events), label: "ランキング"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_compact), label: "自習室"),
              BottomNavigationBarItem(icon: Icon(Icons.people), label: "フレンド"),
            ],
          ),
        ),
      ),
    );
  }

  DataTable generateDataTable([bool isFriend = false]) {
    var rng = new Random();
    return DataTable(
      decoration: BoxDecoration(
        color: Colors.blue[100],
      ),
      columns: [
        DataColumn(
          label: Container(
            width: 30,
            child: Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        DataColumn(
          label: Text(
            '順位',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: Text(
            '名前',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(
          label: Text(
            '時間',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
      rows: List<DataRow>.generate(
        10,
            (index) => DataRow(
          color: MaterialStateProperty.all(
            index % 2 == 0 ? Colors.white60 : Colors.white70,
          ),
          cells: [
            DataCell(
              Container(
                height: 24, // Adjust as needed
                width: 24, // Adjust as needed
                child: Image.network(
                    'https://free-icons.net/wp-content/uploads/2021/01/symbol047.png'),
              ),
            ),
            DataCell(
              Text(
                '${index + 1}位',
                style: TextStyle(
                  fontSize: index <= 2 ? 20 : 15,
                  color: index == 0
                      ? Color(0xFFFFD700)
                      : index == 1
                      ? Color(0xFFC0C0C0)
                      : index == 2
                      ? Color(0xFF8C4841)
                      : null,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            DataCell(
              Text(
                isFriend ? 'friend${index + 1}' : 'student${index + 1}',
                textAlign: TextAlign.center,
              ),
            ),
            DataCell(
              Text(

                '${10 - index}時間${(30 - (rng.nextInt(10) + 1) * 3) % 60}分',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}