import 'package:flutter/material.dart';
import 'package:homies_filteration/models/players_list.dart';
import 'package:provider/provider.dart';

import '../consts.dart';

class PlayersPage extends StatefulWidget {
  static String id = 'players-page';

  @override
  State<PlayersPage> createState() => _PlayersPageState();
}

class _PlayersPageState extends State<PlayersPage> {
  TextEditingController _controller = new TextEditingController();
  void addPlayer() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enter Name"),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<PlayersList>(context, listen: false)
                    .addPlayer(_controller.text.trim());
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }

  void deletePlayer(String name) {
    Provider.of<PlayersList>(context, listen: false).removePlayer(name);
  }

  @override
  Widget build(BuildContext context) {
    List<String> players = [];
    players.addAll(Provider.of<PlayersList>(context).players);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addPlayer();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Center(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: players.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: GestureDetector(
                onDoubleTap: () {
                  deletePlayer(players[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(KBorderRadiusButton)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sports_gymnastics),
                        Text(
                          players[index].length > 10
                              ? players[index].substring(0, 7) + '...'
                              : players[index],
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
  /*
  trailing: IconButton(
                    onPressed: () {
                      deletePlayer(players[index]);
                    },
                    icon: Icon(Icons.delete),
                  ),
  
  */
}
