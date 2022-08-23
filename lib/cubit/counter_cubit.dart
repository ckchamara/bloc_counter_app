import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(counterValue: 0, wasIncremented: false));

  void increment() =>
      emit(CounterInitial(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() =>
      emit(CounterInitial(counterValue: state.counterValue - 1, wasIncremented: false));
}
