import 'package:auto_route/annotations.dart';
import 'package:first_homework/modules/program_interpreter/presentation/widgets/custom_spacer.dart';
import 'package:first_homework/modules/program_interpreter/presentation/widgets/custom_text.dart';
import 'package:first_homework/modules/program_interpreter/presentation/widgets/custom_usage_instruction.dart';
import 'package:first_homework/core/themes/app_themes.dart';
import 'package:first_homework/modules/program_interpreter/business/cubit/main_cubit.dart';
import 'package:first_homework/modules/program_interpreter/presentation/widgets/text_input_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

@RoutePage()
class ProgramInterpreterPage extends StatefulWidget {
  const ProgramInterpreterPage({super.key});

  @override
  State<ProgramInterpreterPage> createState() => _ProgramInterpreterPageState();
}

class _ProgramInterpreterPageState extends State<ProgramInterpreterPage> {
  final TextEditingController _initialStateController = TextEditingController();
  final TextEditingController _programController = TextEditingController();

  String? _initialStateErrorMessage;
  String? _programErrorMessage;

  @override
  void dispose() {
    _initialStateController.dispose();
    _programController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listener: (context, state) {
        if (state is WrongFormat) {
          setState(() {
            _initialStateErrorMessage = state.initialStateFormatError;
            _programErrorMessage = state.programFormatError;
          });
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                children: [
                  // Page Body
                  CustomText("First Homework", style: h0),
                  const CustomSpacer(height: 50),
                  const CustomUsageInstruction(),
                  const CustomSpacer(height: 20),
                  const CustomLabel("INITIAL STATE"),
                  TextField(
                    textInputAction: TextInputAction.none,
                    controller: _initialStateController,
                    style: GoogleFonts.mPlusCodeLatin(),
                    onChanged: (_) {
                      // Replace tab character with three spaces
                      if (_initialStateController.text.contains('\t')) {
                        _initialStateController.text = _initialStateController
                            .text
                            .replaceAll('\t', '   ');
                      }
                    },
                    decoration: InputDecoration(
                      errorText: _initialStateErrorMessage,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const CustomSpacer(height: 20),
                  const CustomLabel("PROGRAM"),
                  TextField(
                    textInputAction: TextInputAction.none,
                    controller: _programController,
                    maxLines: null,
                    style: GoogleFonts.spaceMono(),
                    onChanged: (_) {
                      // Replace tab character with three spaces
                      if (_programController.text.contains('\t')) {
                        _programController.text =
                            _programController.text.replaceAll('\t', '   ');
                      }
                    },
                    decoration: InputDecoration(
                      errorText: _programErrorMessage,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const CustomSpacer(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => _onPressed(context),
                        style: elevatedButtonStyle,
                        child: const Text("Evaluate", style: buttonText),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onPressed(BuildContext context) {
    context.read<MainCubit>().evaluate(
          initialState: _initialStateController.text,
          program: _programController.text,
        );
  }
}
