import 'package:flutter/material.dart';
import 'package:piyek/views/game/board/board.dart';
import 'package:piyek/views/game/title_page/title_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number Grid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routes: {
      //   "/": (context) => const TitlePageView(),
      //   "/board": (context) => const BoardView(),
      //   // '/end' :
      // },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;
        Map<String, Widget Function(BuildContext)> _routes = {
          '/': (context) => const TitlePageView(),
          "/board": (context) => BoardView(
                blanks: args?["blanks"],
                boardSize: args?["boardSize"],
              ),
        };
        return MaterialPageRoute(builder: _routes[settings.name]!);
      },
    );
  }
}
