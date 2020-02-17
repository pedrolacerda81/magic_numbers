part of 'magic_numbers_bloc.dart';

abstract class MagicNumbersEvent extends Equatable {
  const MagicNumbersEvent();
}

class MemorizedNumberEvent extends MagicNumbersEvent {
  @override
  List<Object> get props => null;
}