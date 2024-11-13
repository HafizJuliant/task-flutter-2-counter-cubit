import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // Counter dimulai dari 0

  void increment() => emit(state + 1); // Menambah counter 1
  void decrement() => emit(state - 1); // Mengurangi counter 1
  void multiplyByTwo() => emit(state * 2); // Mengalikan counter dengan 2
  void reset() => emit(0); // Reset counter ke 0
}
