part of 'magic_numbers_bloc.dart';

abstract class MagicNumbersState extends Equatable {
  const MagicNumbersState();
}

class MagicNumbersInitial extends MagicNumbersState {
  @override
  List<int> get props {
    final int card = Random().nextInt(6);
    switch (card) {
      case 0:
        return Card.zero;
        break;
      case 1:
        return Card.one;
        break;
      case 2:
        return Card.two;
        break;
      case 3:
        return Card.three;
        break;
      case 4:
        return Card.four;
        break;
      case 5:
        return Card.five;
        break;
      default:
        return Card.zero;
        break;
    }
  }
}

class CheckingZeroState extends MagicNumbersState {
  @override
  List<int> get props => Card.zero;
}

class CheckingOneState extends MagicNumbersState {
  @override
  List<int> get props => Card.one;
}

class CheckingTwoState extends MagicNumbersState {
  @override
  List<int> get props => Card.two;
}

class CheckingThreeState extends MagicNumbersState {
  @override
  List<int> get props => Card.three;
}

class CheckingFourState extends MagicNumbersState {
  @override
  List<int> get props => Card.four;
}

class CheckingFiveState extends MagicNumbersState {
  @override
  List<int> get props => Card.five;
}