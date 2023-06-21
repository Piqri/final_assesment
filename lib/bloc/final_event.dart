part of 'final_bloc.dart';

@freezed
class FinalEvent with _$FinalEvent {
  const factory FinalEvent.onGetResultNumberOne(int number) =
      FinalEventGetResultNumberOne;
  const factory FinalEvent.onGetResultNumberTwo(int number) =
      FinalEventGetResultNumberTwo;
  const factory FinalEvent.onGetResultNumberThree(int number) =
      FinalEventGetResultNumberThree;
  const factory FinalEvent.onGetResultNumberFour(int number) =
      FinalEventGetResultNumberFour;
}
