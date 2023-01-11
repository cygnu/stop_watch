import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerModel {}

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier(TimerModel state) : super(state);

  final Stopwatch timer = Stopwatch();
  final dul = const Duration(seconds: 1);
  String timerDisplay = '00:00:00';

  void keepRunning() {
    if (timer.isRunning) {
      Timer(dul, keepRunning);
    }
    timerDisplay = (timer.elapsed.inHours).toString().padLeft(2, '0') +
        ':' +
        (timer.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (timer.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }
}
