import 'package:flutter/material.dart';
import 'package:homies_filteration/components/custom_timer.dart';

class TimerPage extends StatefulWidget {
  static final id = 'timer-page';

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomTimer(),
      ),
    );
  }
}
