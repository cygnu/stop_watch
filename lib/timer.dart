import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ButtonState {
  initial,
  started,
}

class TimerModel {
  const TimerModel(this.timerDisplay, this.buttonState);

  final String timerDisplay;
  final ButtonState buttonState;
}

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier() : super(_initialState);

  static final _initialState = TimerModel(timerDisplay, ButtonState.initial);

  final Stopwatch timer = Stopwatch();
  static const dul = Duration(seconds: 1);
  static String timerDisplay = '00:00:00';

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

  void start() {
    timer.start();
    Timer(dul, keepRunning);
    state = TimerModel(timerDisplay, ButtonState.started);
  }

  void pause() {
    timer.stop();
    state = TimerModel(timerDisplay, ButtonState.initial);
  }
}
