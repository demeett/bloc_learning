import 'package:equatable/equatable.dart';

class NumberCubit extends Equatable {
  NumberCubit(this.number);
  int number;

  @override
  List<int> get props => [number];


}
