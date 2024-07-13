import 'package:convenient_thought/Images.dart';
import 'package:equatable/equatable.dart';

abstract class BlocState extends Equatable {
  // final List<City> cities;
  const BlocState();

  @override
  List<Object?> get props => [];
}

class Initial extends BlocState {}

class Loading extends BlocState {}

class Loaded extends BlocState {
  List<Images> itemValue;
  Loaded({required this.itemValue});
}

class Error extends BlocState {
  final String? message;
  const Error(this.message);
}
