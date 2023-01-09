import 'package:flutter/material.dart';

void main() {
  runApp(const WatchApp());
}

class WatchApp extends StatelessWidget {
  const WatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stop Watch'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Center(child: Text('00:00:00')),
          ElevatedButton(
            child: const Text('Start'),
            onPressed: () {},
          )
        ]),
      ),
    );
  }
}
