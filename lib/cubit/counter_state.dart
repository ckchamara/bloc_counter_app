part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int counterValue;
  final bool wasIncremented;

  CounterState(this.counterValue, this.wasIncremented);
}

class CounterInitial extends CounterState {
  CounterInitial({required int counterValue, required bool wasIncremented})
      : super(counterValue, wasIncremented);
}
