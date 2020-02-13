import 'dart:async';
import 'dart:math';
import '../../models/card.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'magic_numbers_event.dart';
part 'magic_numbers_state.dart';

class MagicNumbersBloc extends Bloc<MagicNumbersEvent, MagicNumbersState> {
  @override
  MagicNumbersState get initialState => MagicNumbersInitial();

  @override
  Stream<MagicNumbersState> mapEventToState(
    MagicNumbersEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
