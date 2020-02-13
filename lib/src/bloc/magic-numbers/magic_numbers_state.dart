part of 'magic_numbers_bloc.dart';

abstract class MagicNumbersState extends Equatable {
  const MagicNumbersState();
}

class MagicNumbersInitial extends MagicNumbersState {
  @override
  List<Object> get props {
    final int card = Random().nextInt(5);
    switch (card) {
      case 0:
        return Card.one;
      case 1:
        return Card.two;
      default:
        return Card.one;
      //TODO: ...
    }
  }
}
