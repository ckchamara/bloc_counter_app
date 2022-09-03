import 'package:bloc_counter_app/constants/enum.dart';
import 'package:bloc_counter_app/cubit/counter_cubit.dart';
import 'package:bloc_counter_app/cubit/internet_cubit.dart';
import 'package:bloc_counter_app/presentation/screens/second_screen.dart';
import 'package:bloc_counter_app/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return Text(
                  'wifi',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.green),
                );
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return Text('mobile',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: Colors.red));
              } else if (state is InternetDisconnected) {
                return Text('disconnected');
              }
              return CircularProgressIndicator();
            }),
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Incremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                } else if (state.wasIncremented == false) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Decremented!'),
                      duration: Duration(milliseconds: 300),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ' + state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',
                    style: Theme.of(context).textTheme.headline4,
                  );
                } else
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headline4,
                  );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} #2'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                    // context.bloc<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (secondScreenContext) => BlocProvider.value(
                          value: BlocProvider.of<CounterCubit>(context),
                          child: SecondScreen(
                              title: 'Second Screen', color: Colors.redAccent),
                        )));
              },
              child: const Text('Go to SecondScreen'),
            ),
            SizedBox(
              height: 24,
            ),
            MaterialButton(
              color: widget.color,
              onPressed: () {
                Navigator.of(context).pushNamed('/third'); //Named Routes
              },
              child: const Text('Go to ThirdScreen'),
            )
          ],
        ),
      ),
    );
  }
}
