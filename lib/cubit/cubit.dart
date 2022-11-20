import 'package:bloc_learning/cubit/cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitClass extends Cubit<int> {
  CubitClass() : super(0);
  int number = 0;
  Future<void> increment() async {
    emit(number++);
  }

  Future<void> decrement() async {
    
    emit(number--);
  }
}
