import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerModel {}

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier(TimerModel state) : super(state);

  final Stopwatch timer = Stopwatch();
  final dul = const Duration(milliseconds: 10);
  String timerDisplay = '00:00:00';

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
}
