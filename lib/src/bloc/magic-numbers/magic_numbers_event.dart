part of 'magic_numbers_bloc.dart';

abstract class MagicNumbersEvent extends Equatable {
  const MagicNumbersEvent();
}

class ResetGameEvent extends MagicNumbersEvent {
  final int result;
  ResetGameEvent({@required this.result});
  @override
  List<Object> get props => null;
}

class CheckZeroEvent extends MagicNumbersEvent {
  @override
  List<Object> get props => null;
}

class CheckOneEvent extends MagicNumbersEvent {
  final int result;
  CheckOneEvent({@required this.result});
  @override
  List<Object> get props => null;
}

class CheckTwoEvent extends MagicNumbersEvent {
  final int result;
  CheckTwoEvent({@required this.result});
  @override
  List<Object> get props => null;
}

class CheckThreeEvent extends MagicNumbersEvent {
  final int result;
  CheckThreeEvent({@required this.result});
  @override
  List<Object> get props => null;
}

class CheckFourEvent extends MagicNumbersEvent {
  final int result;
  CheckFourEvent({@required this.result});
  @override
  List<Object> get props => null;
}

class CheckFiveEvent extends MagicNumbersEvent {
  final int result;
  CheckFiveEvent({@required this.result});
  @override
  List<Object> get props => null;
}
