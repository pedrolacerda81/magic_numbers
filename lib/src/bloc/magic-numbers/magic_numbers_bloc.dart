import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:magic_numbers/src/models/card.dart';

part 'magic_numbers_event.dart';
part 'magic_numbers_state.dart';

class MagicNumbersBloc extends Bloc<MagicNumbersEvent, MagicNumbersState> {
  @override
  MagicNumbersState get initialState => MagicNumbersInitial();

  @override
  Stream<MagicNumbersState> mapEventToState(MagicNumbersEvent event) async* {
    if(event is ResetGameEvent) {
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

  Stream<MagicNumbersState> _mapResetGameEventToState(MagicNumbersEvent event) async* {
    yield MagicNumbersInitial();
  }

  Stream<MagicNumbersState> _mapCheckZeroEventToState(MagicNumbersEvent event) async* {
    yield CheckingZeroState();
  }

  Stream<MagicNumbersState> _mapCheckOneEventToState(MagicNumbersEvent event) async* {
    yield CheckingOneState();
  }

  Stream<MagicNumbersState> _mapCheckTwoEventToState(MagicNumbersEvent event) async* {
    yield CheckingTwoState();
  }

  Stream<MagicNumbersState> _mapCheckThreeEventToState(MagicNumbersEvent event) async* {
    yield CheckingThreeState();
  }

  Stream<MagicNumbersState> _mapCheckFourEventToState(MagicNumbersEvent event) async* {
    yield CheckingFourState();
  }

  Stream<MagicNumbersState> _mapCheckFiveEventToState(MagicNumbersEvent event) async* {
    yield CheckingFiveState();
  }
}
