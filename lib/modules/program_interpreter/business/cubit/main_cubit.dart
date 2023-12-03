import 'package:first_homework/modules/program_interpreter/models/program_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_cubit_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  void evaluate({required String initialState, required String program}) {
    emit(Evaluation());

    // FEM = Format Error Message
    String? initialStateFEM = initialStateFormatChecker(initialState);
    String? programFEM = programFormatChecker(program);

    if (initialStateFEM != null || programFEM != null) {
      emit(WrongFormat(
        initialStateFormatError: initialStateFEM,
        programFormatError: programFEM,
      ));
      return;
    }

    // CREATE INITIAL PROGRAM STATE
    ProgramState programState = ProgramState();

    List<String> pairs = initialState.split(',');
    for (String pair in pairs) {
      var parts = pair.split(':');
      var variable = parts[0].replaceAll(" ", "");
      var value = int.parse(parts[1]);

      programState.set(variable, value);
    }

    debugPrint(programState.toString());
  }

  /// Checks the format of the initial state input.
  ///
  /// The function performs two main steps:
  ///
  /// 1. **Format Check**: Uses a regular expression to check if the input follows
  ///    the expected format. The format should be a sequence of variable-value pairs
  ///    separated by commas, where each pair consists of a lowercase letter followed
  ///    by a colon and an integer. Example: "a:1, b:-2, c:3".
  ///    Returns an error message if the format is invalid.
  ///
  /// 2. **Redundancy Check**: Verifies if there are redundant definitions by checking
  ///    if the same variable is defined more than once in the input. Returns an error
  ///    message if redundancy is detected.
  ///
  /// If both checks pass, the function returns `null`, indicating that the input
  /// adheres to the specified format.
  ///
  /// Example usage:
  /// ```dart
  /// String? result = initialStateFormatChecker("a:1, b:-2, c:3");
  /// if (result == null) {
  ///   print("Format is valid.");
  /// } else {
  ///   print("Error: $result");
  /// }
  /// ```
  @visibleForTesting
  String? initialStateFormatChecker(String input) {
    // STEP ONE | CHECK ON FORMAT
    RegExp goodFormat = RegExp(r'^([a-z]:-?\d+)(,\s*[a-z]:-?\d+)*$');
    Match? match = goodFormat.firstMatch(input);
    if (match == null || match.end != input.length) {
      return "Invalid format, check instruction on top.";
    }

    // STEP TWO | CHECK ON REDUNDANT DEFINITON
    Set<String> seenVariables = <String>{};

    List<String> pairs = input.split(',');
    for (String pair in pairs) {
      var parts = pair.split(':');
      var variable = parts[0].replaceAll(" ", "");

      if (seenVariables.contains(variable)) {
        return "Redundant definition are not allowed."; // REDOUNDANT DEFINITON
      } else {
        seenVariables.add(variable);
      }
    }

    return null;
  }

  @visibleForTesting
  String? programFormatChecker(String input) {
    // STEP ZERO | INPUT SANITIZATION
    final program = input
        .replaceAll(
          " ",
          "",
        )
        .replaceAll(
          "\n",
          "",
        )
        .replaceAll(
          "\t",
          "",
        )
        .toLowerCase();

    // STEP ONE | PARENTHESES BALANCE CHECK + COHERENCE
    List<String> stack = [];

    for (int i = 0; i < program.length; i++) {
      String currentChar = input[i];
      // PARENTHESES CAN BE ONLY AFTER if, while, until, for
      if (currentChar == '(' && !openParenthesisCheck(program, i)) {
        return "Error in character ${i + 1} : '(' must be preceded by if, while, until or for ";
      }
      // Braces can only be preceded by ")" (while and for) and ";" (repeat-until)
      if (currentChar == '{' && !openBraceCheck(program, i)) {
        return "Error in character ${i + 1} : '(' must be preceded by if, while, until or for ";
      }

      if (currentChar == '(' || currentChar == '[' || currentChar == '{') {
        stack.add(currentChar);
      } else if (currentChar == ')' ||
          currentChar == ']' ||
          currentChar == '}') {
        if (stack.isEmpty) {
          // Unmatched closing parenthesis
          return "Unmatched closing parenthesis on character ${i + 1}";
        }

        String topOfStack = stack.removeLast();
        if (!((topOfStack == '(' && currentChar == ')') ||
            (topOfStack == '[' && currentChar == ']') ||
            (topOfStack == '{' && currentChar == '}'))) {
          // Mismatched opening and closing parenthesis
          return "Mismatched opening and closing parenthesis on character ${i + 1}";
        }
      }
    }
    // USING THE FACT THAT EVERY LOOP BODY IS INSIDE {}

    return null;
  }

  @visibleForTesting
  bool openParenthesisCheck(String input, int index) {
    // Index too close to the beginning of the string.
    if (index < 2) {
      return false;
    }
    // Program starting with if
    if (index == 2) {
      String precedingSubstring = input.substring(index - 2, index);
      return precedingSubstring.contains("if");
    }
    // Program starting with for loop
    if (index == 3) {
      String precedingSubstring = input.substring(index - 3, index);
      return precedingSubstring.contains("for");
    }
    // Program starting with while loop
    if (index == 5) {
      String precedingSubstring = input.substring(index - 5, index);
      return precedingSubstring.contains("while");
    }

    // Preceded by another open parenthesis "for((" was a problem
    if (input.substring(index - 1, index).contains("(")) return false;
    if (input.substring(index - 1, index).contains("{")) return false;

    // All the other cases
    String precedingSubstring = input.substring(index - 6, index);
    return ['if', 'while', 'until', 'for'].contains(precedingSubstring);
  }

  @visibleForTesting
  bool openBraceCheck(String input, int index) {
    // Repeat until at the beginning
    if (index == 0) return true;

    // All other cases
    String precedingSubstring = input.substring(index - 1, index);
    return [')', ';'].contains(precedingSubstring);
  }
}
