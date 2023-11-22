import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homies_filteration/consts.dart';
import 'package:provider/provider.dart';

import '../models/timer_prop.dart';

class CustomTimer extends StatefulWidget {
  const CustomTimer({super.key});
  void resetTimerButton() {
    // Here we reset the timer
  }

  @override
  State<CustomTimer> createState() => _CustomTimerState();
}

class _CustomTimerState extends State<CustomTimer> {
  int timeLeft = 15;
  bool timerOn = false, timerStarted = false;

  void resetTimer() {
    setState(() {
      timerOn = false;
      timeLeft = Provider.of<TimerProp>(context, listen: false).seconds;
    });
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        if (timerOn) {
          if (mounted) {
            setState(() {
              timeLeft--;
            });
          }
        }
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    timeLeft = Provider.of<TimerProp>(context).seconds;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () {
            if (timerOn == false) {
              if (timerStarted == false) {
                startTimer();
                timerStarted = true;
              }
              timerOn = true;
            } else {
              timerOn = false;
            }
          },
          onDoubleTap: resetTimer,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(KBorderRadiusButton)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(timeLeft == 0
                  ? "Done"
                  : (timeLeft / 60).toInt().toString() +
                      ':' +
                      (timeLeft % 60).toString()),
            ),
          )),
    );
  }
}
