part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

class IncrementButtonClicked extends CounterEvent {}

class DecrementButtonClicked extends CounterEvent {}
