import 'package:first_homework/modules/program_interpreter/business/cubit/main_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('MainCubit', () {
    test('openParenthesisCheck', () {
      // ARRANGE
      final MainCubit testObj = MainCubit();
      final List<String> dataSet = [
        "(x<100){",
        "while(x<100){x=x+1}",
        "while((x<100){{x=x+1}",
        "for(x=20to30){x=x+1}",
        "for((x=20to30){x=x+1}",
      ];
      final List<bool> expectedResults = [
        false,
        true,
        true,
        false,
        true,
        true,
        false,
      ];
      final List<bool> actualResults = [];

      // ACT
      for (var program in dataSet) {
        for (int i = 0; i < program.length; i++) {
          String currentChar = program[i];
          // PARENTHESES CAN BE ONLY AFTER if, while, until, for
          if (currentChar == '(') {
            actualResults.add(testObj.openParenthesisCheck(program, i));
          }
        }
      }

      //ASSERT
      for (int i = 0; i < expectedResults.length; i++) {
        expect(actualResults[i], expectedResults[i]);
      }
    });
  });

  test('openBracesCheck', () {
    // ARRANGE
    final MainCubit testObj = MainCubit();
    final List<String> dataSet = [
      "(x<100){",
      "while(x<100){x=x+1}",
      "while((x<100){{x=x+1}",
      "for(x=20to30){x=x+1}",
      "for((x=20to30){x=x+1}",
    ];
    final List<bool> expectedResults = [
      true,
      true,
      true,
      false,
      true,
      true,
    ];
    final List<bool> actualResults = [];

    // ACT
    for (var program in dataSet) {
      for (int i = 0; i < program.length; i++) {
        String currentChar = program[i];
        // PARENTHESES CAN BE ONLY AFTER if, while, until, for
        if (currentChar == '{') {
          actualResults.add(testObj.openBraceCheck(program, i));
        }
      }
    }

    //ASSERT
    for (int i = 0; i < expectedResults.length; i++) {
      expect(actualResults[i], expectedResults[i]);
    }
  });
}
