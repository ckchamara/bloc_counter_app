import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:bloc_counter_app/presentation/screens/home_screen.dart';
import 'package:bloc_counter_app/presentation/screens/second_screen.dart';
import 'package:bloc_counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: HomeScreen(title: 'Home', color: Colors.blueAccent),
                ));
        break;
      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: SecondScreen(title: 'Second', color: Colors.redAccent),
                ));
        break;
      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: ThirdScreen(
                      title: 'ThirdScreen', color: Colors.greenAccent),
                ));
        break;

      default:
        null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
