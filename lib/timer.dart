import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerModel {
  const TimerModel(this.timerDisplay, this.isRunning);

  final String timerDisplay;
  final bool isRunning;
}

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier() : super(_initialState);

  static final _initialState = TimerModel(timerDisplay, false);

  final Stopwatch timer = Stopwatch();
  static const dul = Duration(seconds: 1);
  static String timerDisplay = '00:00:00';

  void _keepRunning() {
    if (timer.isRunning) {
      Timer(dul, _keepRunning);
    }
    timerDisplay = (timer.elapsed.inHours).toString().padLeft(2, '0') +
        ':' +
        (timer.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (timer.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  void start() {
    timer.start();
    Timer(dul, _keepRunning);
    state = TimerModel(timerDisplay, true);
  }

  void pause() {
    timer.stop();
    state = TimerModel(timerDisplay, false);
  }
}
