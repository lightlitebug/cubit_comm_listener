part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;
  ColorState({
    required this.color,
  });

  @override
  List<Object> get props => [color];

  @override
  bool get stringify => true;

  factory ColorState.initial() {
    return ColorState(color: Colors.red);
  }

  ColorState copyWith({
    Color? color,
  }) {
    return ColorState(
      color: color ?? this.color,
    );
  }
}
