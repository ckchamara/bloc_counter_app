import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription internetStreamSubcription;

  CounterCubit({required this.internetCubit})
      : super(CounterInitial(counterValue: 0, wasIncremented: false)) {
    internetStreamSubcription = internetCubit.stream.listen((internetState) {
      if(internetState is InternetIConnected )
    });
  }

  void increment() => emit(CounterInitial(
      counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterInitial(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
