import 'package:flutter/material.dart';
import 'package:homies_filteration/components/custom_button.dart';
import 'package:homies_filteration/models/players_list.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<PlayersList>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('setting-page');
              },
              icon: const Icon(
                Icons.list,
                color: Colors.black,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.13, horizontal: 8),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Good Morning, chief",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomButton(
                        text: "Players",
                        function: () {
                          Navigator.of(context).pushNamed('players-page');
                        }),
                    CustomButton(
                        text: "League",
                        function: () {
                          Navigator.of(context).pushNamed('league-page');
                        })
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
