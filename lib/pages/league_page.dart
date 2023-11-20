import 'package:flutter/material.dart';
import 'package:homies_filteration/components/custom_match_tile.dart';
import 'package:provider/provider.dart';

import '../models/players_list.dart';

class LeaguePage extends StatefulWidget {
  static String id = 'league-page';

  @override
  State<LeaguePage> createState() => _LeaguePageState();
}

class _LeaguePageState extends State<LeaguePage> {
  @override

  //Load the players lists
  void initState() {
    super.initState();
    var tempS =
        Provider.of<PlayersList>(context, listen: false).shuffledPlayers;
    var temp = Provider.of<PlayersList>(context, listen: false).players;
    if (tempS.isEmpty) {
      tempS.addAll(Provider.of<PlayersList>(context, listen: false).players);
    }
    if (tempS != temp) {
      tempS = [];
      tempS.addAll(temp);
      Provider.of<PlayersList>(context, listen: false).shuffledPlayers = tempS;
    }
  }

  //Shuffle the players in ShuffledPlayers list
  void shuffle() {
    Provider.of<PlayersList>(context, listen: false).shufflePlayers();
    setState(() {});
  }

  //Move the pointer in case of non x4 lists
  void proceed() {
    setState(() {
      var playersData = Provider.of<PlayersList>(context, listen: false);

      playersData.pointer =
          (playersData.pointer + 4) % (playersData.players.length);
      if (playersData.players.length % 2 == 0 &&
          playersData.players.length % 4 != 0 &&
          playersData.pointer == 2) {
        List<String> subPlayers = playersData.shuffledPlayers
            .sublist(playersData.pointer, playersData.players.length);
        subPlayers.shuffle();
        playersData.shuffledPlayers
            .replaceRange(2, playersData.players.length, subPlayers);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Vars
    List<String> players =
        Provider.of<PlayersList>(context, listen: false).shuffledPlayers;
    int pointer = Provider.of<PlayersList>(context, listen: false).pointer;
    int matchCount = (players.length / 4).toInt();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (players.length % 4 == 0) {
            shuffle();
          } else {
            proceed();
          }
        },
        child: const Icon(
          Icons.keyboard_double_arrow_right_sharp,
          color: Colors.white,
        ),
      ),
      body: Builder(
        builder: (context) {
          if (players.length < 4) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.face,
                    size: 40,
                  ),
                  Text("Add more players",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
                ],
              ),
            );
          }
          if (players.length % 4 == 0) {
            return Center(
                child: ListView.builder(
                    itemCount: matchCount,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                              index == 0
                                  ? "Current Match"
                                  : index == 1
                                      ? "Next Match"
                                      : "After Next Match",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          CustomMatchTile(
                              p1: players[0 + index * 4],
                              p2: players[1 + index * 4],
                              p3: players[2 + index * 4],
                              p4: players[3 + index * 4]),
                        ],
                      );
                    }));
          } else {
            return Center(
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            index == 0 ? "Current Match" : "Next Match",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          CustomMatchTile(
                              p1: players[
                                  (pointer + 0 + index * 4) % players.length],
                              p2: players[
                                  (pointer + 1 + index * 4) % players.length],
                              p3: players[
                                  (pointer + 2 + index * 4) % players.length],
                              p4: players[
                                  (pointer + 3 + index * 4) % players.length]),
                          index == 0
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: players.map((item) {
                                      bool condition = players[pointer] == item;

                                      return Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: condition
                                                  ? Colors.green
                                                  : Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  color: condition
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                        ],
                      );
                    }));
          }
        },
      ),
    );
  }
}
//players[(pointer + 1 + index * 4) %players.length]
