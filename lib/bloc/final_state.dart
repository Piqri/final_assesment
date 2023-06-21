part of 'final_bloc.dart';

@freezed
class FinalState with _$FinalState {
  const factory FinalState.initial({
    required List<String> result,
    required TextEditingController textController,
  }) = FinalStateInitial;
}
