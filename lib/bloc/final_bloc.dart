import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'final_event.dart';
part 'final_state.dart';
part 'final_bloc.freezed.dart';

class FinalBloc extends Bloc<FinalEvent, FinalState> {
  FinalBloc()
      : super(
          FinalState.initial(
            result: [],
            textController: TextEditingController(),
          ),
        ) {
    on<FinalEventGetResultNumberOne>(_onGetResultNumberOne);
    on<FinalEventGetResultNumberTwo>(_onGetResultNumberTwo);
    on<FinalEventGetResultNumberThree>(_onGetResultNumberThree);
    on<FinalEventGetResultNumberFour>(_onGetResultNumberFour);
  }

  Future<void> _onGetResultNumberOne(
      FinalEventGetResultNumberOne event, Emitter<FinalState> emit) async {
    final List<String> result = [];

    for (var i = 1; i <= event.number; i++) {
      result.add(i.toString());
    }
    emit(state.copyWith(result: result));
  }

  Future<void> _onGetResultNumberTwo(
      FinalEventGetResultNumberTwo event, Emitter<FinalState> emit) async {
    final List<String> result = [];

    for (var i = 1; i <= event.number; i++) {
      result.add(i.toString());

      if (i == event.number) {
        for (var j = event.number - 1; j > 0; j--) {
          result.add(j.toString());
        }
      }
    }
    emit(state.copyWith(result: result));
  }

  Future<void> _onGetResultNumberThree(
      FinalEventGetResultNumberThree event, Emitter<FinalState> emit) async {
    final List<String> result = [];
    int index = 10;

    for (var i = 0; i < event.number; i++) {
      result.add((index + i * 11).toString());
    }
    emit(state.copyWith(result: result));
  }

  Future<void> _onGetResultNumberFour(
      FinalEventGetResultNumberFour event, Emitter<FinalState> emit) async {
    final List<String> result = [];

    for (var i = 1; i < event.number + 1; i++) {
      if (i % 5 == 0) {
        result.add('Lima');
      } else if (i % 7 == 0) {
        result.add('Tujuh');
      } else {
        result.add(i.toString());
      }
    }
    emit(state.copyWith(result: result));
  }
}
