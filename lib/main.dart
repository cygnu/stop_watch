import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'timer.dart';

void main() {
  runApp(
    const ProviderScope(child: WatchApp()),
  );
}

class WatchApp extends HookConsumerWidget {
  const WatchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerDisplay = ref.read(timeProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Stop Watch'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                timerDisplay,
                style: const TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.w900),
              ),
            ),
            const SizedBox(height: 20.0),
            const ButtonsContainer()
          ],
        ),
      ),
    );
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, TimerModel>(
  (ref) => TimerNotifier(),
);

final _timeProvider = Provider<String>((ref) {
  return ref.watch(timerProvider).timerDisplay;
});

final timeProvider = Provider<String>((ref) {
  return ref.watch(_timeProvider);
});

final _buttonState = Provider<ButtonState>((ref) {
  return ref.watch(timerProvider).buttonState;
});

final buttonProvider = Provider<ButtonState>((ref) {
  return ref.watch(_buttonState);
});

class ButtonsContainer extends HookConsumerWidget {
  const ButtonsContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(buttonProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (state == ButtonState.initial) ...[
          const StartButton(),
        ],
        if (state == ButtonState.started) ...[
          const PauseButton(),
        ],
      ],
    );
  }
}

class StartButton extends ConsumerWidget {
  const StartButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      onPressed: () {
        ref.read(timerProvider.notifier).start();
      },
    );
  }
}

class PauseButton extends ConsumerWidget {
  const PauseButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.pause),
      onPressed: () {
        ref.read(timerProvider.notifier).pause();
      },
    );
  }
}
