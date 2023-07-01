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
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                color: Colors.pinkAccent.shade100,
                height: 250,
                width: 310,
                child: const Center(
                  child: Text(
                    "休憩中",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Positioned(
              top: 260,
              left: 0,
              child: Container(
                color: Colors.blueAccent.shade100,
                height: 50,
                width: 310,
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
              )),
          Positioned(
              top: 320,
              left: 0,
              child: Container(
                color: Colors.blueAccent.shade100,
                height: 80,
                width: 150,
                child: const Center(
                  child: Text(
                    "自分",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Positioned(
              top: 320,
              left: 160,
              child: Container(
                color: Colors.blueAccent.shade100,
                height: 80,
                width: 150,
                child: const Center(
                  child: Text(
                    "友達A",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Positioned(
              top: 0,
              left: 315,
              child: Container(
                color: Colors.orangeAccent.shade400,
                height: 600,
                width: 100,
                child: const Center(
                  child: Text(
                    "部屋",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                color: Colors.lightGreen.shade100,
                height: 150,
                width: 310,
                child: const Text(
                  "チャット欄...",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ))
        ],
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

//   Container _online() {
//     return Container(
//       width: 350,
//       height: 200,
//       decoration: BoxDecoration(
//           color: Colors.pinkAccent, borderRadius: BorderRadius.circular(14.5)),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "休憩中",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//           Text(
//             "残り○○分",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Container _request() {
//     return Container(
//       width: 350,
//       height: 100,
//       decoration: BoxDecoration(
//           color: Colors.blue.shade300,
//           borderRadius: BorderRadius.circular(14.5)),
//       child: const Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             "時間延長する",
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
// }
