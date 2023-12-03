part of 'main_cubit.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class Evaluation extends MainState {}

final class WrongFormat extends MainState {
  final String? initialStateFormatError;
  final String? programFormatError;

  WrongFormat({
    this.initialStateFormatError,
    this.programFormatError,
  });
}
