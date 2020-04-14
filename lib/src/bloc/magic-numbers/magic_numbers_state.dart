part of 'magic_numbers_bloc.dart';

abstract class MagicNumbersState extends Equatable {
  final List<int> card;
  const MagicNumbersState({@required this.card});
}

class MagicNumbersInitial extends MagicNumbersState {
  final List<int> card;
  MagicNumbersInitial({@required this.card});
  @override
  List<int> get props => card;
}

class CheckingZeroState extends MagicNumbersState {
  final List<int> card;
  final int result;
  CheckingZeroState({@required this.card, this.result});
  @override
  List<int> get props => null;
}

class CheckingOneState extends MagicNumbersState {
  final List<int> card;
  final int result;
  CheckingOneState({@required this.card, this.result});
  @override
  List<int> get props => null;
}

class CheckingTwoState extends MagicNumbersState {
  final List<int> card;
  final int result;
  CheckingTwoState({@required this.card, this.result});
  @override
  List<int> get props => null;
}

class CheckingThreeState extends MagicNumbersState {
  final List<int> card;
  final int result;
  CheckingThreeState({@required this.card, this.result});
  @override
  List<int> get props => null;
}

class CheckingFourState extends MagicNumbersState {
  final List<int> card;
  final int result;
  CheckingFourState({@required this.card, this.result});
  @override
  List<int> get props => null;
}

class CheckingFiveState extends MagicNumbersState {
  final List<int> card;
  final int result;
  CheckingFiveState({@required this.card, this.result});
  @override
  List<int> get props => null;
}
