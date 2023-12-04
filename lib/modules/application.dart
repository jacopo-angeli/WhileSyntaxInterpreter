import 'package:first_homework/modules/program_interpreter/presentation/program_iterpreter_page.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ProgramInterpreterPage(),
      },
    );
  }
}
