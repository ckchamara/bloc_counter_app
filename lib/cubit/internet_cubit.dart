import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_counter_app/constants/enum.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  final Connectivity connectivity;
  StreamSubscription? connectivitySubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((_connectivityResult) {
      if (_connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
      } else if (_connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
      }else if(_connectivityResult == ConnectivityResult.none);{
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetIConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() async {
    connectivitySubscription?.cancel();
  }
}
