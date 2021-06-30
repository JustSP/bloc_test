part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  final int counter = 0;
  final String message = "";
}

class CounterInitial extends CounterState {
  final int counter;
  final String message;
  CounterInitial({required this.counter, required this.message});
}

class CounterIncreased extends CounterState {
  final int counter;
  final String message;
  CounterIncreased({required this.counter, required this.message});
}

class CounterDecreased extends CounterState {
  final int counter;
  final String message;
  CounterDecreased({required this.counter, required this.message});
}
