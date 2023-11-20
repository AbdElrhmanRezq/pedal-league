import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:homies_filteration/models/players_list.dart';
import 'package:homies_filteration/pages/homepage.dart';
import 'package:homies_filteration/pages/league_page.dart';
import 'package:homies_filteration/pages/players_page.dart';
import 'package:homies_filteration/themes/light_theme.dart';
import 'package:provider/provider.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayersList>(
      create: (context) => PlayersList(),
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: 'homepage',
        routes: {
          'homepage': (context) => Homepage(),
          PlayersPage.id: (context) => PlayersPage(),
          LeaguePage.id: (context) => LeaguePage()
        },
      ),
    );
  }
}
