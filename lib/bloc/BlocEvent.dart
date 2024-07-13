import 'package:equatable/equatable.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

class GetLogin extends BlocEvent {
  final int code;
  final String password;

  const GetLogin({required this.code, required this.password});
}

class GetImages extends BlocEvent {
  String path;

  GetImages({required this.path});

}
//
// class GetChemInfo extends BlocEvent {}
