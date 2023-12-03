import 'package:first_homework/core/themes/app_themes.dart';
import 'package:first_homework/modules/program_interpreter/presentation/widgets/custom_spacer.dart';
import 'package:first_homework/modules/program_interpreter/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

const programSyntax = '''

n ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
    | 0 n |1 n | 2 n | 3 n | 4 n | 5 n | 6 n | 7 n | 8 n | 9 n

a ::= n | x | a' + a''  | a' * a'' | a' - a''

b ::= true | false | a' == a'' | a' ≤ a'' | a' < a'' | !b | b' & b'' 

S ::= x=a | skip | S';S'' | if (b) then S' else S'' done | while (b) { S }
    | { S } until (b) | for (x=a' to a'') { S }
''';

// USAGE INSTRUCTION WIDGET
class CustomUsageInstruction extends StatelessWidget {
  const CustomUsageInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomText("INITIAL STATE FORMAT", style: h1),
          const CustomSpacer(height: 10),
          CustomText(
            "Enter the initial state using the following format:",
            style: p,
            indentation: 10,
          ),
          const CustomText(
            "Variable1: Value1, Variable2: Value2, ..., VariableN: ValueN",
            indentation: 10,
            isCode: true,
          ),
          CustomText(
            "• Ensure that you separate each variable-value pair with a comma and follow the pattern shown above,",
            style: p,
            indentation: 10,
          ),
          CustomText(
            "• Redundant definition are not allowed,",
            style: p,
            indentation: 10,
          ),
          CustomText(
            "• Note that spaces are not considered during evaluation.",
            style: p,
            indentation: 10,
          ),
          const CustomSpacer(height: 20),
          CustomText("While+", style: h1),
          CustomText(
            "Program syntax of while+.",
            style: p,
            indentation: 10,
          ),
          const CustomText(
            programSyntax,
            indentation: 10,
            isCode: true,
          ),
        ],
      ),
    );
  }
}
