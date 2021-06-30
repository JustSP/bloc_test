import 'package:bloc_test/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CounterBloc _bloc = CounterBloc();

  @override
  void initState() {
    _bloc.add(DecrementButtonClicked());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Test | My Counter App"),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
              bloc: _bloc,
              builder: (context, state) {
                return counterWidget(state.counter, state.message);
              }),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  _bloc.add(DecrementButtonClicked());
                }),
            const SizedBox(
              width: 30,
            ),
            FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  _bloc.add(IncrementButtonClicked());
                }),
          ],
        ),
      ),
    );
  }

  Widget counterWidget(int counter, String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message, style: const TextStyle(fontSize: 32)),
        Text(counter.toString(),
            style: const TextStyle(fontSize: 45, color: Colors.blue)),
      ],
    );
  }
}
