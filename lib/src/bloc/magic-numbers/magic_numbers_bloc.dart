import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:magic_numbers/src/models/card.dart';

part 'magic_numbers_event.dart';
part 'magic_numbers_state.dart';

class MagicNumbersBloc extends Bloc<MagicNumbersEvent, MagicNumbersState> {
  List<int> _getCard(int cardNumber) {
    switch (cardNumber) {
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

  @override
  MagicNumbersState get initialState =>
      MagicNumbersInitial(card: _getCard(Random().nextInt(6)));

  @override
  Stream<MagicNumbersState> mapEventToState(MagicNumbersEvent event) async* {
    if (event is ResetGameEvent) {
      yield* _mapResetGameEventToState(event);
    }
    if (event is CheckZeroEvent) {
      yield* _mapCheckZeroEventToState(event);
    }
    if (event is CheckOneEvent) {
      yield* _mapCheckOneEventToState(event);
    }
    if (event is CheckTwoEvent) {
      yield* _mapCheckTwoEventToState(event);
    }
    if (event is CheckThreeEvent) {
      yield* _mapCheckThreeEventToState(event);
    }
    if (event is CheckFourEvent) {
      yield* _mapCheckFourEventToState(event);
    }
    if (event is CheckFiveEvent) {
      yield* _mapCheckFiveEventToState(event);
    }
  }

  Stream<MagicNumbersState> _mapResetGameEventToState(
      ResetGameEvent event) async* {
    yield MagicNumbersInitial(card: _getCard(Random().nextInt(6)));
  }

  Stream<MagicNumbersState> _mapCheckZeroEventToState(
      CheckZeroEvent event) async* {
    final int initialResult = 0;
    yield CheckingZeroState(card: Card.zero, result: initialResult);
  }

  Stream<MagicNumbersState> _mapCheckOneEventToState(
      CheckOneEvent event) async* {
    yield CheckingOneState(card: Card.one, result: event.result);
  }

  Stream<MagicNumbersState> _mapCheckTwoEventToState(
      CheckTwoEvent event) async* {
    yield CheckingTwoState(card: Card.two, result: event.result);
  }

  Stream<MagicNumbersState> _mapCheckThreeEventToState(
      CheckThreeEvent event) async* {
    yield CheckingThreeState(card: Card.three, result: event.result);
  }

  Stream<MagicNumbersState> _mapCheckFourEventToState(
      CheckFourEvent event) async* {
    yield CheckingFourState(card: Card.four, result: event.result);
  }

  Stream<MagicNumbersState> _mapCheckFiveEventToState(
      CheckFiveEvent event) async* {
    yield CheckingFiveState(card: Card.five, result: event.result);
  }
}
