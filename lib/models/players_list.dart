import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class PlayersList extends ChangeNotifier {
  List<String> players = [];
  List<String> shuffledPlayers = [];
  int pointer = 0;

  void getData() async {
    var box = await Hive.openBox('myBox');
    if (box.get('players') != null) players.addAll(box.get('players'));
  }

  void addPlayer(String player) async {
    players.add(player);
    var box = await Hive.openBox('myBox');
    box.put("players", players);
    notifyListeners();
  }

  void removePlayer(String player) async {
    players.remove(player);
    var box = await Hive.openBox('myBox');
    box.delete("players");
    box.put("players", players);
    notifyListeners();
  }

  void shufflePlayers() {
    shuffledPlayers.shuffle();
    notifyListeners();
  }
}
