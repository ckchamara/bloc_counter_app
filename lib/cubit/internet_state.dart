part of 'internet_cubit.dart';



@immutable
abstract class InternetState {

}

class InternetLoading extends InternetState {}

class InternetIConnected extends InternetState {
   final ConnectionType connectionType;

   InternetIConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
