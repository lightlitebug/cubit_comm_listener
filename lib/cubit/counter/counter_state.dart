part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  @override
  List<Object> get props => [counter];

  @override
  bool get stringify => true;

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
