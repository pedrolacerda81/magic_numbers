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
    if (event is MemorizedNumberEvent) {
      yield* _mapMemorizedNumberEventToState(event);
    }
    if(event is ResetGameEvent) {
      yield* _mapResetGameEventToState(event);
    }
  }

  Stream<MagicNumbersState> _mapMemorizedNumberEventToState(MagicNumbersEvent event) async* {
    yield MagicNumbersPlayingState();
  }

  Stream<MagicNumbersState> _mapResetGameEventToState(MagicNumbersEvent event) async* {
    yield MagicNumbersInitial();
  }
}
