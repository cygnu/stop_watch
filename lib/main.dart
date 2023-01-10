import 'package:flutter/material.dart';

void main() {
  runApp(WatchApp());
}

class WatchApp extends StatelessWidget {
  WatchApp({Key? key}) : super(key: key);
  final Stopwatch timer = Stopwatch();

  @override
  Widget build(BuildContext context) {
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
