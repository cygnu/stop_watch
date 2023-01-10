import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(WatchApp());
}

class WatchApp extends StatelessWidget {
  WatchApp({Key? key}) : super(key: key);
  final Stopwatch timer = Stopwatch();
  final dul = const Duration(milliseconds: 10);
  String timerDisplay = '00:00:00';

  @override
  Widget build(BuildContext context) {
    void keepRunning() {
      if (timer.isRunning) {
        Timer(dul, keepRunning);
      }
      int milliSeconds = ((timer.elapsedMilliseconds / 10).floor() % 100);
      // ignore: prefer_interpolation_to_compose_strings
      timerDisplay = (timer.elapsed.inHours).toString().padLeft(2, '0') +
          ':' +
          (timer.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ':' +
          (timer.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
          ':' +
          (milliSeconds).toString().padLeft(2, '0');
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stop Watch'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(
            child: Text(
              '00:00:00',
              style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 20.0),
          IconButton(
            icon: const Icon(Icons.play_arrow),
            color: Colors.blueAccent,
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
