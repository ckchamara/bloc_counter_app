import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:bloc_counter_app/presentation/router/app_router.dart';
import 'package:bloc_counter_app/presentation/screens/home_screen.dart';
import 'package:bloc_counter_app/presentation/screens/second_screen.dart';
import 'package:bloc_counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<MyApp> {

  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: _appRouter.onGenerateRoute,

      // routes: {
      //   '/': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: HomeScreen(title: 'HomePage', color: Colors.blueAccent),
      //       ),
      //   '/second': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child:
      //             SecondScreen(title: 'SecondPage', color: Colors.blueAccent),
      //       ),
      //   '/third': (context) => BlocProvider.value(
      //         value: _counterCubit,
      //         child: ThirdScreen(title: 'ThirdPage', color: Colors.greenAccent),
      //       )
      // },
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),

      // home: BlocProvider(
      //   create: (context) => CounterCubit(),
      //   child: HomeScreen(
      //     title: 'Flutter Demo Home Page',
      //     color: Colors.lightBlueAccent,
      //   ),
      // ),
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
