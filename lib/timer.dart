import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerModel {}

class TimerNotifier extends StateNotifier<TimerModel> {
  TimerNotifier(TimerModel state) : super(state);
}
