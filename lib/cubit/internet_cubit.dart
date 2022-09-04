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
    monitorInternetConnection();
  }

  void monitorInternetConnection() {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen((_connectivityResult) {
          print('monitorinternetconn');
      if (_connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnected(ConnectionType.wifi);
        print('wifi');
      } else if (_connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnected(ConnectionType.mobile);
        print('mobile');
      } else if(_connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
        print('disconeccted..');
      }
    });
  }

  void emitInternetConnected(ConnectionType _connectionType) =>
      emit(InternetConnected(connectionType: _connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() async {
    connectivitySubscription?.cancel();
  }
}
