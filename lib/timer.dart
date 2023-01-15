import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerModel {
  const TimerModel({required this.timerDisplay, required this.isRunning});

  final String timerDisplay;
  final bool isRunning;

  TimerModel copyWith({String? timerDisplay, bool? isRunning}) {
    return TimerModel(
      timerDisplay: timerDisplay ?? this.timerDisplay,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier()
      : super(const TimerModel(timerDisplay: '00:00:00', isRunning: false));

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
    state = state.copyWith(timerDisplay: timerDisplay, isRunning: true);
  }

  void pause() {
    timer.stop();
    state = state.copyWith(timerDisplay: timerDisplay, isRunning: false);
  }
}
