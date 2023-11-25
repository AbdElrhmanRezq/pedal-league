import 'package:flutter/material.dart';
import 'package:homies_filteration/consts.dart';
import 'package:provider/provider.dart';

import '../models/timer_prop.dart';

class SettingPage extends StatefulWidget {
  static const id = 'setting-page';

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController _controller = new TextEditingController();
  void changeTimer() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enter Time in minutes"),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<TimerProp>(context, listen: false)
                    .setTimer(double.parse(_controller.text.trim()));
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text(
                "Set",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double timerValue = Provider.of<TimerProp>(context).seconds / 60;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(KBorderRadiusButton)),
                child: ListTile(
                  leading: const Icon(Icons.timer),
                  title: TextButton(
                    onPressed: () {
                      changeTimer();
                    },
                    child: Text(
                      "Current Timer: $timerValue",
                      style: TextStyle(
                          color: Colors.grey[300], fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
